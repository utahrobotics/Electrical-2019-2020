#include <ros.h>
#include <sensor_msgs/Imu.h>
#include "Arduino.h"

#define NO_CRC_CHECK

#ifndef NO_CRC_CHECK
#define BADCRC 11
#endif

/* pin definitions */
#define ClkPin 6
#define InFrame 9
#define DataReady 10
#define SPin 11
#define ClkIntEnabled 12
#define IMUInit 13 /* Orange LED indicates when IMU is ready */
#define BADCHECKSUM 14
#define BADDATA 15
#define IMUDataReady 17
#define RxData 20

#define OpeningFlag 0x7e
#define HDLC_FRAME_LENGTH 14
#define ACC_BUFFER_LENGTH 400

#define SETIMUINIT(v) digitalWriteFast(IMUInit, v); imuInit = (bool) v
#define SETINFRAME(v) digitalWriteFast(InFrame, v); inFrame = (bool) v
#define SETREADY(v) digitalWriteFast(DataReady, v); ready = (bool) v
#define SETSPIN(v) digitalWriteFast(SPin, v); spin = (bool) v
#define DETACHCLK if (interrupt) {\
    detachInterrupt(digitalPinToInterrupt(ClkPin));\
    interrupt = false;\
    digitalWriteFast(ClkIntEnabled, LOW);\
}

ros::NodeHandle nh;

typedef geometry_msgs::Vector3 Vector3;

sensor_msgs::Imu imu_msg;
sensor_msgs::Imu imu_msg_na;
// TODO: double check that this is always zero initialized
static Vector3 accbuffer[ACC_BUFFER_LENGTH];
int accidx = 0;
int initidx = -1;
Vector3 gravity;

ros::Publisher imu_pub("imu", &imu_msg);
ros::Publisher imu_na_pub("imu_norm", &imu_msg_na);

double ts; /* time stamp set when IMUDataReady drops */
uint16_t buffer[HDLC_FRAME_LENGTH];
uint16_t derBuffer = 0;
uint16_t wordBuffer = 0;
bool imuInit = false;
bool inFrame = false;
bool ready = false;
bool spin = true;
bool interrupt = false;
int bitCounter = 0;
int idx = 0;

/* used in bit reversal (input bits are big-endian) */
static uint16_t rtab[256] = {
  0x00, 0x80, 0x40, 0xc0, 0x20, 0xa0, 0x60, 0xe0,
  0x10, 0x90, 0x50, 0xd0, 0x30, 0xb0, 0x70, 0xf0,
  0x08, 0x88, 0x48, 0xc8, 0x28, 0xa8, 0x68, 0xe8,
  0x18, 0x98, 0x58, 0xd8, 0x38, 0xb8, 0x78, 0xf8,
  0x04, 0x84, 0x44, 0xc4, 0x24, 0xa4, 0x64, 0xe4,
  0x14, 0x94, 0x54, 0xd4, 0x34, 0xb4, 0x74, 0xf4,
  0x0c, 0x8c, 0x4c, 0xcc, 0x2c, 0xac, 0x6c, 0xec,
  0x1c, 0x9c, 0x5c, 0xdc, 0x3c, 0xbc, 0x7c, 0xfc,
  0x02, 0x82, 0x42, 0xc2, 0x22, 0xa2, 0x62, 0xe2,
  0x12, 0x92, 0x52, 0xd2, 0x32, 0xb2, 0x72, 0xf2,
  0x0a, 0x8a, 0x4a, 0xca, 0x2a, 0xaa, 0x6a, 0xea,
  0x1a, 0x9a, 0x5a, 0xda, 0x3a, 0xba, 0x7a, 0xfa,
  0x06, 0x86, 0x46, 0xc6, 0x26, 0xa6, 0x66, 0xe6,
  0x16, 0x96, 0x56, 0xd6, 0x36, 0xb6, 0x76, 0xf6,
  0x0e, 0x8e, 0x4e, 0xce, 0x2e, 0xae, 0x6e, 0xee,
  0x1e, 0x9e, 0x5e, 0xde, 0x3e, 0xbe, 0x7e, 0xfe,
  0x01, 0x81, 0x41, 0xc1, 0x21, 0xa1, 0x61, 0xe1,
  0x11, 0x91, 0x51, 0xd1, 0x31, 0xb1, 0x71, 0xf1,
  0x09, 0x89, 0x49, 0xc9, 0x29, 0xa9, 0x69, 0xe9,
  0x19, 0x99, 0x59, 0xd9, 0x39, 0xb9, 0x79, 0xf9,
  0x05, 0x85, 0x45, 0xc5, 0x25, 0xa5, 0x65, 0xe5,
  0x15, 0x95, 0x55, 0xd5, 0x35, 0xb5, 0x75, 0xf5,
  0x0d, 0x8d, 0x4d, 0xcd, 0x2d, 0xad, 0x6d, 0xed,
  0x1d, 0x9d, 0x5d, 0xdd, 0x3d, 0xbd, 0x7d, 0xfd,
  0x03, 0x83, 0x43, 0xc3, 0x23, 0xa3, 0x63, 0xe3,
  0x13, 0x93, 0x53, 0xd3, 0x33, 0xb3, 0x73, 0xf3,
  0x0b, 0x8b, 0x4b, 0xcb, 0x2b, 0xab, 0x6b, 0xeb,
  0x1b, 0x9b, 0x5b, 0xdb, 0x3b, 0xbb, 0x7b, 0xfb,
  0x07, 0x87, 0x47, 0xc7, 0x27, 0xa7, 0x67, 0xe7,
  0x17, 0x97, 0x57, 0xd7, 0x37, 0xb7, 0x77, 0xf7,
  0x0f, 0x8f, 0x4f, 0xcf, 0x2f, 0xaf, 0x6f, 0xef,
  0x1f, 0x9f, 0x5f, 0xdf, 0x3f, 0xbf, 0x7f, 0xff
};

inline uint16_t reverse(uint16_t x) {
    return (rtab[x & 0xff] << 8) | rtab[x >> 8];
}

/* IMU clock interrupt */
void clk_ISR(void) {
    /* If we already have data, leave */
    if (ready) {
        /* but first detach interrupt */
        DETACHCLK
        return;
    }
    register uint8_t rval = digitalReadFast(RxData);
    derBuffer <<= 1;
    derBuffer |= rval;
    /* look for opening/closing flag */
    if ((derBuffer & 0xff) == OpeningFlag) {
        inFrame = !inFrame;
        digitalWriteFast(InFrame, inFrame);
        if (inFrame) {
            bitCounter = 0;
            idx = 0;
        }
        else {
            digitalWriteFast(BADDATA, (idx == HDLC_FRAME_LENGTH ? LOW : HIGH));
            SETREADY(1);
        }
        return;
    }
    /* add bits to wordbuffer and store words to buffer */
    /* exclude padding bits */
    if ((idx == 0 && bitCounter < 5) || ((derBuffer & 0x3f) ^ 0x3e)) {
        wordBuffer <<= 1;
        wordBuffer |= rval;
        if (++bitCounter == 16) {
            bitCounter = 0;
            if (idx >= HDLC_FRAME_LENGTH) {
                digitalWriteFast(BADDATA, HIGH);
                idx = 0;
            }
            buffer[idx++] = reverse(wordBuffer);
        }
    }
}

/* IMU data ready interrupt */
void set_ts(void) {
    /* set timestamp and prepare to receive data */
    // TODO: use more accurate timing
    ts = seconds();
    SETINFRAME(0);
    SETREADY(0);
    SETSPIN(0);
    digitalWriteFast(BADDATA, LOW);
    digitalWriteFast(BADCHECKSUM, LOW);
#ifndef NO_CRC_CHECK
    digitalWriteFast(BADCRC, LOW);
#endif
}

#ifndef NO_CRC_CHECK

/*
 * The following code comes from RFC 1331.
 * See https://tools.ietf.org/html/rfc1331#appendix-B
 */

/*
* FCS lookup table as calculated by the table generator in section
* B.2.
*/
static uint16_t fcstab[256] = {
  0x0000, 0x1189, 0x2312, 0x329b, 0x4624, 0x57ad, 0x6536, 0x74bf,
  0x8c48, 0x9dc1, 0xaf5a, 0xbed3, 0xca6c, 0xdbe5, 0xe97e, 0xf8f7,
  0x1081, 0x0108, 0x3393, 0x221a, 0x56a5, 0x472c, 0x75b7, 0x643e,
  0x9cc9, 0x8d40, 0xbfdb, 0xae52, 0xdaed, 0xcb64, 0xf9ff, 0xe876,
  0x2102, 0x308b, 0x0210, 0x1399, 0x6726, 0x76af, 0x4434, 0x55bd,
  0xad4a, 0xbcc3, 0x8e58, 0x9fd1, 0xeb6e, 0xfae7, 0xc87c, 0xd9f5,
  0x3183, 0x200a, 0x1291, 0x0318, 0x77a7, 0x662e, 0x54b5, 0x453c,
  0xbdcb, 0xac42, 0x9ed9, 0x8f50, 0xfbef, 0xea66, 0xd8fd, 0xc974,
  0x4204, 0x538d, 0x6116, 0x709f, 0x0420, 0x15a9, 0x2732, 0x36bb,
  0xce4c, 0xdfc5, 0xed5e, 0xfcd7, 0x8868, 0x99e1, 0xab7a, 0xbaf3,
  0x5285, 0x430c, 0x7197, 0x601e, 0x14a1, 0x0528, 0x37b3, 0x263a,
  0xdecd, 0xcf44, 0xfddf, 0xec56, 0x98e9, 0x8960, 0xbbfb, 0xaa72,
  0x6306, 0x728f, 0x4014, 0x519d, 0x2522, 0x34ab, 0x0630, 0x17b9,
  0xef4e, 0xfec7, 0xcc5c, 0xddd5, 0xa96a, 0xb8e3, 0x8a78, 0x9bf1,
  0x7387, 0x620e, 0x5095, 0x411c, 0x35a3, 0x242a, 0x16b1, 0x0738,
  0xffcf, 0xee46, 0xdcdd, 0xcd54, 0xb9eb, 0xa862, 0x9af9, 0x8b70,
  0x8408, 0x9581, 0xa71a, 0xb693, 0xc22c, 0xd3a5, 0xe13e, 0xf0b7,
  0x0840, 0x19c9, 0x2b52, 0x3adb, 0x4e64, 0x5fed, 0x6d76, 0x7cff,
  0x9489, 0x8500, 0xb79b, 0xa612, 0xd2ad, 0xc324, 0xf1bf, 0xe036,
  0x18c1, 0x0948, 0x3bd3, 0x2a5a, 0x5ee5, 0x4f6c, 0x7df7, 0x6c7e,
  0xa50a, 0xb483, 0x8618, 0x9791, 0xe32e, 0xf2a7, 0xc03c, 0xd1b5,
  0x2942, 0x38cb, 0x0a50, 0x1bd9, 0x6f66, 0x7eef, 0x4c74, 0x5dfd,
  0xb58b, 0xa402, 0x9699, 0x8710, 0xf3af, 0xe226, 0xd0bd, 0xc134,
  0x39c3, 0x284a, 0x1ad1, 0x0b58, 0x7fe7, 0x6e6e, 0x5cf5, 0x4d7c,
  0xc60c, 0xd785, 0xe51e, 0xf497, 0x8028, 0x91a1, 0xa33a, 0xb2b3,
  0x4a44, 0x5bcd, 0x6956, 0x78df, 0x0c60, 0x1de9, 0x2f72, 0x3efb,
  0xd68d, 0xc704, 0xf59f, 0xe416, 0x90a9, 0x8120, 0xb3bb, 0xa232,
  0x5ac5, 0x4b4c, 0x79d7, 0x685e, 0x1ce1, 0x0d68, 0x3ff3, 0x2e7a,
  0xe70e, 0xf687, 0xc41c, 0xd595, 0xa12a, 0xb0a3, 0x8238, 0x93b1,
  0x6b46, 0x7acf, 0x4854, 0x59dd, 0x2d62, 0x3ceb, 0x0e70, 0x1ff9,
  0xf78f, 0xe606, 0xd49d, 0xc514, 0xb1ab, 0xa022, 0x92b9, 0x8330,
  0x7bc7, 0x6a4e, 0x58d5, 0x495c, 0x3de3, 0x2c6a, 0x1ef1, 0x0f78
};

#define INITFCS 0xffff  /* Initial FCS value */
#define GOODFCS 0xf0b8  /* Good final FCS value */

/*
* Calculate a new fcs given the current fcs and the new data.
*/
inline uint16_t fcs(uint16_t fcs, const uint8_t* cp, size_t len) {
    while (len--) {
        fcs = (fcs >> 8) ^ fcstab[(fcs ^ *cp++) & 0xff];
    }

    return fcs;
}

/* My code again below */

inline int crc_check(const uint16_t* data, size_t length) {
    return (fcs(INITFCS, (uint8_t*) data, length * 2) - GOODFCS);
}
#endif

struct ImuData {
    double timestamp;
    int16_t x_delta_vel;
    int16_t y_delta_vel;
    int16_t z_delta_vel;
    int16_t x_delta_angle;
    int16_t y_delta_angle;
    int16_t z_delta_angle;
    uint16_t imu_status_summary_word;
    uint16_t mux_id;
    uint16_t multiplexed_data_word;
    uint16_t reserved1;
    uint16_t reserved2;
    uint16_t reserved3;
    uint16_t checksum;

    ImuData() : timestamp(0),
                x_delta_vel(0),
                y_delta_vel(0),
                z_delta_vel(0),
                x_delta_angle(0),
                y_delta_angle(0),
                z_delta_angle(0),
                imu_status_summary_word(0),
                mux_id(0),
                multiplexed_data_word(0),
                reserved1(0),
                reserved2(0),
                reserved3(0),
                checksum(0xffff)
    {}

    /* assign data from the  buffer if CRC and checksum are good */
    /* otherwise only timestamp is updated */
    uint16_t set_data(const uint16_t* data) {
        timestamp = ts;
#ifndef NO_CRC_CHECK
        if (crc_check(data, 13)) {
            digitalWriteFast(BADCRC, HIGH);
            return 1;
        }
#endif
        uint16_t sum = 0;
        for (size_t i = 0; i < 12; i++) {
            sum += data[i];
        }
        uint16_t csdiff = ((uint16_t) ~sum) ^ data[12];
        if (csdiff) {
            digitalWriteFast(BADCHECKSUM, HIGH);
            return csdiff;
        }
        x_delta_vel = (int16_t) data[0];
        y_delta_vel = (int16_t) data[1];
        z_delta_vel = (int16_t) data[2];
        x_delta_angle = (int16_t) data[3];
        y_delta_angle = (int16_t) data[4];
        z_delta_angle = (int16_t) data[5];
        imu_status_summary_word = data[6];
        mux_id = data[7];
        multiplexed_data_word = data[8];
        reserved1 = data[9];
        reserved2 = data[10];
        reserved3 = data[11];
        checksum = data[12];
        return 0;
    }
} raw_imu_data, raw_imu_data1;

inline double magnitude(const Vector3 v) {
    return sqrt(v.x * v.x + v.y * v.y + v.z * v.z);
}

inline Vector3 operator-(Vector3 v0, const Vector3 v1) {
    v0.x -= v1.x;
    v0.y -= v1.y;
    v0.z -= v1.z;
    return v0;
}

inline Vector3 vavg(Vector3 *va, int start, int end, int length) {
    Vector3 v;
    for (int i = start; i < end; i++) {
        int j = (i < 0 ? length + i : i);
        v.x += va[j].x;
        v.y += va[j].y;
        v.z += va[j].z;
    }
    v.x /= end - start;
    v.y /= end - start;
    v.z /= end - start;
    return v;
}

/* used in orientation calculation */
typedef geometry_msgs::Quaternion Quaternion;

inline Quaternion q(float w, float x, float y, float z) {
    Quaternion q;
    q.w = w;
    q.x = x;
    q.y = y;
    q.z = z;
    return q;
}

inline Quaternion v2q(const Vector3 v) {
    return q(0, v.x, v.y, v.z);
}

inline Vector3 q2v(const Quaternion q) {
    Vector3 v;
    v.x = q.x;
    v.y = q.y;
    v.z = q.z;
    return v;
}

inline Quaternion& operator+=(Quaternion& q0, const Quaternion q1) {
    q0.w += q1.w;
    q0.x += q1.x;
    q0.y += q1.y;
    q0.z += q1.z;
    return q0;
}

inline Quaternion operator*(double s, Quaternion q) {
    q.w *= s;
    q.x *= s;
    q.y *= s;
    q.z *= s;
    return q;
}

inline Quaternion operator*(Quaternion q0, const Quaternion& q1) {
    q0.w = (q0.w*q1.w-q0.x*q1.x-q0.y*q1.y-q0.z*q1.z);
    q0.x = (q0.w*q1.x+q0.x*q1.w+q0.y*q1.z-q0.z*q1.y);
    q0.y = (q0.w*q1.y-q0.x*q1.z+q0.y*q1.w+q0.z*q1.x);
    q0.z = (q0.w*q1.z+q0.x*q1.y-q0.y*q1.x+q0.z*q1.w);
    return q0;
}

inline Quaternion conj(Quaternion q) {
    q.x = -q.x;
    q.y = -q.y;
    q.z = -q.z;
    return q;
}

inline Vector3 crotate(Vector3 v, Quaternion q) {
    return q2v(conj(q) * v2q(v) * q);
}

#define DELTA(dir, q) (raw_imu_data1.dir##_delta_##q)
#define DT (raw_imu_data1.timestamp - raw_imu_data.timestamp)
#define DIFF(dir, q) (DELTA(dir, q) / DT)
#define ANGLE_EXP -19
#define VEL_EXP -14

inline int fillImuMsg() {
    struct ImuData pdata = raw_imu_data1;
    // TODO: fix possible divide by zero issue
    uint16_t status = raw_imu_data1.set_data(buffer);
    if (!status) {
        raw_imu_data = pdata;
    }
    imu_msg.header.stamp.fromSec(raw_imu_data1.timestamp);
    imu_msg.angular_velocity.x = ldexp(DIFF(x, angle), ANGLE_EXP);
    imu_msg.angular_velocity.y = ldexp(DIFF(y, angle), ANGLE_EXP);
    imu_msg.angular_velocity.z = ldexp(DIFF(z, angle), ANGLE_EXP);
    imu_msg.linear_acceleration.x = ldexp(DIFF(x, vel), VEL_EXP);
    imu_msg.linear_acceleration.y = ldexp(DIFF(y, vel), VEL_EXP);
    imu_msg.linear_acceleration.z = ldexp(DIFF(z, vel), VEL_EXP);
    imu_msg.orientation += 0.5 * q(0, ldexp((double) DELTA(x, angle), ANGLE_EXP),
                                      ldexp((double) DELTA(y, angle), ANGLE_EXP),
                                      ldexp((double) DELTA(z, angle), ANGLE_EXP))
                               * imu_msg.orientation;

    accbuffer[accidx++] = imu_msg.linear_acceleration;
    if (accidx >= ACC_BUFFER_LENGTH) {
        accidx = 0;
    }

    // TODO: Possibly a better way to detect that IMU is initialized
    if (initidx < 0) {
        double g = magnitude(
                vavg(accbuffer, accidx - 3, accidx, ACC_BUFFER_LENGTH));

        if (9.6 < g && g < 10) {
            initidx = accidx;
        }
        /* If IMU is not initialized, do not publish data */
        return 1;
    }
    else if (!imuInit) {
        if (accidx == initidx) {
            gravity = vavg(accbuffer, 0, ACC_BUFFER_LENGTH, ACC_BUFFER_LENGTH);
            SETIMUINIT(1);
        }
        else {/* Initialized, but gravity not set */
            return -1;
        }
    }

    imu_msg_na.header = imu_msg.header;
    imu_msg_na.angular_velocity = imu_msg.angular_velocity;
    imu_msg_na.orientation = imu_msg.orientation;

    /* Subtract off gravity */
    imu_msg_na.linear_acceleration = imu_msg.linear_acceleration
            - crotate(gravity, imu_msg.orientation);

    return 0;
}

void setup() {
    Serial.begin(115200);

#ifndef NO_CRC_CHECK
    pinMode(BADCRC, OUTPUT);
    digitalWriteFast(BADCRC, LOW);
#endif

    pinMode(BADCHECKSUM, OUTPUT);
    pinMode(BADDATA, OUTPUT);
    pinMode(IMUDataReady, INPUT);
    pinMode(RxData, INPUT);
    pinMode(IMUInit, OUTPUT);
    pinMode(InFrame, OUTPUT);
    pinMode(DataReady, OUTPUT);
    pinMode(SPin, OUTPUT);
    pinMode(ClkIntEnabled, OUTPUT);

    digitalWriteFast(BADCHECKSUM, LOW);
    digitalWriteFast(BADDATA, LOW);
    SETIMUINIT(0);
    SETINFRAME(0);
    SETREADY(0);
    SETSPIN(1);
    digitalWriteFast(ClkIntEnabled, interrupt);

    nh.initNode();
    nh.advertise(imu_pub);
    nh.advertise(imu_na_pub);

    imu_msg.orientation.w = 1; // zero angle

    // TODO: define known covariance
    for (size_t i = 0; i < 9; i++) {
        imu_msg.angular_velocity_covariance[i] = 0;
        imu_msg.linear_acceleration_covariance[i] = 0;
        imu_msg.orientation_covariance[i] = 0;
        imu_msg_na.angular_velocity_covariance[i] = 0;
        imu_msg_na.linear_acceleration_covariance[i] = 0;
        imu_msg_na.orientation_covariance[i] = 0;
    }

    delay(100);
    attachInterrupt(digitalPinToInterrupt(IMUDataReady), set_ts, FALLING);
}

void loop() {
    if (ready) {
        DETACHCLK

        int status = fillImuMsg();
        if (status <= 0) {
            imu_pub.publish(&imu_msg);
            if (!status) {/* Only publish if gravity is set */
                imu_na_pub.publish(&imu_msg_na);
            }
        }
#ifndef NO_CRC_CHECK
        digitalWriteFast(BADCRC, LOW);
#endif
        digitalWriteFast(BADCHECKSUM, LOW);
        SETREADY(0);
        SETSPIN(1);
    }
    else if (spin) {
        nh.spinOnce();
    }
    else if (!interrupt) {
        /* enable IMU clock interrupt */
        interrupt = true;
        digitalWriteFast(ClkIntEnabled, HIGH);
        attachInterrupt(digitalPinToInterrupt(ClkPin), clk_ISR, RISING);
    }
    else {
        /* wait for interrupt */
//        asm("wfi");
        /* but keep running CPU clock */
        asm("nop");
    }
}
