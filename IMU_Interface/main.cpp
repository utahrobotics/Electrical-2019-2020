#include <ros.h>
#include <std_msgs/String.h>
#include "Arduino.h"

double seconds(void)
{
    return micros() / 1e6;
}

ros::NodeHandle nh;

std_msgs::String debug_msg, err_msg, generic_msg;

ros::Publisher debug_pub("debug", &debug_msg);
ros::Publisher err_pub("err", &err_msg);
ros::Publisher generic_pub("general", &generic_msg);

bool ready = false;
bool spin = true;

double ts, old_ts;
#define DT (ts - old_ts)

void set_ts(void) {
    old_ts = ts;
    ts = seconds();
    ready = false;
    spin = false;
}

static char buffer[400];

void set_message() {
    static int number;
    int off = snprintf(buffer, 99, "Header #%d with timestamp %.6f s\n\n",
                       ++number, ts);
    int i = 0;
    while (off < 370) {
        off += snprintf(&buffer[off], 400-off, "Random number #%d: %.6f\n",
                        ++i, random(1000000) / 1e6);
    }
    generic_msg.data = buffer;
    ready = true;
}

static double data_period = 2.5e-3;

void setup() {
    Serial.begin(115200);

    ready = false;
    spin = true;

    nh.initNode();
    nh.setSpinTimeout(1); // 1 ms timeout on spin
    nh.advertise(debug_pub);
    nh.advertise(err_pub);
    nh.advertise(generic_pub);

    /* wait for connection before starting work */
    while (!nh.connected()) {
        nh.spinOnce();
    }

    debug_msg.data = "Finished setup";
    debug_pub.publish(&debug_msg);
    nh.spinOnce();

    ts = seconds();
}

static double tspin = 0, tset = 0, tpdebug = 0, tpgeneric = 0;
static double tsdebug = 0, tsgeneric = 0;

#define DBGPUB debug_msg.data = debug_str;\
               debug_pub.publish(&debug_msg)
#define ERRPUB err_msg.data = debug_str;\
               err_pub.publish(&err_msg)

void loop() {
    if (ready) {
        tsdebug = seconds();
        char debug_str[999];
        snprintf(debug_str, 50, "Last timestamp diff: %.3f ms", DT*1e3);
        DBGPUB;
        if (abs(DT - data_period) > 10e-6) {
            ERRPUB;
        }

        snprintf(debug_str, 50, "Last spin: %.3f ms", tspin*1e3);
        DBGPUB;
        if (tspin > 1e-3) {
            ERRPUB;
        }

        snprintf(debug_str, 50, "Last set: %.3f ms", tset*1e3);
        DBGPUB;
        if (tset > 1e-3) {
            ERRPUB;
        }

        snprintf(debug_str, 999,
                 "Last publish times:\n"
                 "    Debug: %.3f ms from %.3f ms to %.3f ms\n"
                 "    General: %.3f ms from %.3f ms to %.3f ms\n",
                 tpdebug*1e3, tsdebug*1e3, (tsdebug+tpdebug)*1e3,
                 tpgeneric*1e3, tsgeneric*1e3, (tsgeneric+tpgeneric)*1e3);
        DBGPUB;
        if (tpdebug+tpgeneric > 1e-3) {
            ERRPUB;
        }

        tpdebug = seconds() - tsdebug;

        tsgeneric = seconds();
        generic_pub.publish(&generic_msg);
        tpgeneric = seconds() - tsgeneric;

        ready = false;
        spin = true;
    }
    else if (spin) {
        /* Spin once, then wait for next timestamp */
        double now = seconds();
        nh.spinOnce();
        tspin = seconds() - now;
        double udelay = 1e6*(ts+data_period-seconds());
        if (udelay > 0) {
            delayMicroseconds((uint32_t) udelay);
        }
        set_ts();
    }
    else {
        double now = seconds();
        set_message();
        tset = seconds() - now;
    }
}
