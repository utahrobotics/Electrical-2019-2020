def sendToMCU(sendStr):
    ser.write(sendStr)

def recvFromMCU():
    global startMarker, endMarker

    while not ser.inWaiting():
        pass

    result = ""
    x = "\x00"

    # wait for a nonzero character
    while not ord(x):
        x = ser.read()

    # save 32 bytes of data
    for i in range(32):
        result += chr(ord(x))
        x = ser.read()

    return result

#======================================
# The above code was based on an internet example


from sys import argv
import time
import serial

import matplotlib.pyplot as plt
import numpy as np


if __name__ == "__main__":
    # set up connection to MCU
    serPort="/dev/ttyACM0" if len(argv) < 2 else argv[1]
    baudRate=115200
    ser=serial.Serial(serPort, baudRate)

#     startMarker=ord('<')
#     endMarker=ord('>')

    # leave socket open and run in interactive mode from here
#     ser.close
