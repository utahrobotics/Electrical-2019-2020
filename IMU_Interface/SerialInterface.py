from sys import argv
import serial
import time

import matplotlib.pyplot as plt
import numpy as np

def sendToMCU(sendStr):
    ser.write(sendStr)

def recvFromMCU(N=1000):
    while not ser.inWaiting():
        pass

    line=""
    time=[]
    omega=[]
    acc=[]
    orientation=[]

    return [ser.readline().lstrip(b'\x00').decode('utf-8').strip()
            for n in range(N)]

    for n in range(N):
        line=ser.readline().lstrip(b'\x00').decode('utf-8').strip()
        t, wx, wy, wz, ax, ay, az, w, x, y, z=map(float, line.split())
        time.append(t)
        omega.append([wx, wy, wz])
        acc.append([ax, ay, az])
        orientation.append([w, x, y, z])

    return np.array(time), np.array(omega), np.array(acc), np.array(orientation)

if __name__ == "__main__":
    # set up connection to MCU
    serPort="/dev/ttyACM0" if len(argv) < 2 else argv[1]
    baudRate=115200
    ser=serial.Serial(serPort, baudRate)

    # leave socket open and run in interactive mode from here
#     ser.close
