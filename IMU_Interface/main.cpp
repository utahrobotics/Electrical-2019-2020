#include <ros.h>
#include <std_msgs/String.h>
#include "Arduino.h"

ros::NodeHandle nh;

std_msgs::String debug_msg, generic_msg;

ros::Publisher debug_pub("debug", &debug_msg);
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

void loop() {
    if (ready) {
        double now = seconds();
        char debug_str[999];
        if (abs(DT - data_period) > 10e-6) {
            snprintf(debug_str, 50, "Last timestamp diff: %.3f ms", DT*1e3);
            debug_msg.data = debug_str;
            debug_pub.publish(&debug_msg);
        }

        if (tspin > 1e-3) {
            snprintf(debug_str, 50, "Last spin: %.3f ms", tspin*1e3);
            debug_msg.data = debug_str;
            debug_pub.publish(&debug_msg);
        }

        if (tset > 1e-3) {
            snprintf(debug_str, 50, "Last set: %.3f ms", tset*1e3);
            debug_msg.data = debug_str;
            debug_pub.publish(&debug_msg);
        }

        if (tpdebug > 1e-3) {
            snprintf(debug_str, 200, "Last debug publish time: %.3f ms", tpdebug*1e3);
            debug_msg.data = debug_str;
            debug_pub.publish(&debug_msg);
        }
        if (tpgeneric > 1e-3) {
            snprintf(debug_str, 200, "Last general publish time: %.3f ms", tpgeneric*1e3);
            debug_msg.data = debug_str;
            debug_pub.publish(&debug_msg);
        }
        tpdebug = seconds() - now;

        now = seconds();
        generic_pub.publish(&generic_msg);
        tpgeneric = seconds() - now;

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
