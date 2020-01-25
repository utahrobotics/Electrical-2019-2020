################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../teensy4/AudioStream.cpp \
../teensy4/DMAChannel.cpp \
../teensy4/EventResponder.cpp \
../teensy4/HardwareSerial.cpp \
../teensy4/HardwareSerial1.cpp \
../teensy4/HardwareSerial2.cpp \
../teensy4/HardwareSerial3.cpp \
../teensy4/HardwareSerial4.cpp \
../teensy4/HardwareSerial5.cpp \
../teensy4/HardwareSerial6.cpp \
../teensy4/HardwareSerial7.cpp \
../teensy4/HardwareSerial8.cpp \
../teensy4/IPAddress.cpp \
../teensy4/IntervalTimer.cpp \
../teensy4/Print.cpp \
../teensy4/Stream.cpp \
../teensy4/Tone.cpp \
../teensy4/WMath.cpp \
../teensy4/WString.cpp \
../teensy4/new.cpp \
../teensy4/usb_inst.cpp \
../teensy4/yield.cpp 

S_UPPER_SRCS += \
../teensy4/memcpy-armv7m.S \
../teensy4/memset.S 

C_SRCS += \
../teensy4/analog.c \
../teensy4/bootdata.c \
../teensy4/clockspeed.c \
../teensy4/debugprintf.c \
../teensy4/delay.c \
../teensy4/digital.c \
../teensy4/eeprom.c \
../teensy4/interrupt.c \
../teensy4/keylayouts.c \
../teensy4/nonstd.c \
../teensy4/pwm.c \
../teensy4/rtc.c \
../teensy4/startup.c \
../teensy4/tempmon.c \
../teensy4/usb.c \
../teensy4/usb_desc.c \
../teensy4/usb_rawhid.c \
../teensy4/usb_seremu.c \
../teensy4/usb_serial.c 

C_DEPS += \
./teensy4/analog.d \
./teensy4/bootdata.d \
./teensy4/clockspeed.d \
./teensy4/debugprintf.d \
./teensy4/delay.d \
./teensy4/digital.d \
./teensy4/eeprom.d \
./teensy4/interrupt.d \
./teensy4/keylayouts.d \
./teensy4/nonstd.d \
./teensy4/pwm.d \
./teensy4/rtc.d \
./teensy4/startup.d \
./teensy4/tempmon.d \
./teensy4/usb.d \
./teensy4/usb_desc.d \
./teensy4/usb_rawhid.d \
./teensy4/usb_seremu.d \
./teensy4/usb_serial.d 

OBJS += \
./teensy4/AudioStream.o \
./teensy4/DMAChannel.o \
./teensy4/EventResponder.o \
./teensy4/HardwareSerial.o \
./teensy4/HardwareSerial1.o \
./teensy4/HardwareSerial2.o \
./teensy4/HardwareSerial3.o \
./teensy4/HardwareSerial4.o \
./teensy4/HardwareSerial5.o \
./teensy4/HardwareSerial6.o \
./teensy4/HardwareSerial7.o \
./teensy4/HardwareSerial8.o \
./teensy4/IPAddress.o \
./teensy4/IntervalTimer.o \
./teensy4/Print.o \
./teensy4/Stream.o \
./teensy4/Tone.o \
./teensy4/WMath.o \
./teensy4/WString.o \
./teensy4/analog.o \
./teensy4/bootdata.o \
./teensy4/clockspeed.o \
./teensy4/debugprintf.o \
./teensy4/delay.o \
./teensy4/digital.o \
./teensy4/eeprom.o \
./teensy4/interrupt.o \
./teensy4/keylayouts.o \
./teensy4/memcpy-armv7m.o \
./teensy4/memset.o \
./teensy4/new.o \
./teensy4/nonstd.o \
./teensy4/pwm.o \
./teensy4/rtc.o \
./teensy4/startup.o \
./teensy4/tempmon.o \
./teensy4/usb.o \
./teensy4/usb_desc.o \
./teensy4/usb_inst.o \
./teensy4/usb_rawhid.o \
./teensy4/usb_seremu.o \
./teensy4/usb_serial.o \
./teensy4/yield.o 

S_UPPER_DEPS += \
./teensy4/memcpy-armv7m.d \
./teensy4/memset.d 

CPP_DEPS += \
./teensy4/AudioStream.d \
./teensy4/DMAChannel.d \
./teensy4/EventResponder.d \
./teensy4/HardwareSerial.d \
./teensy4/HardwareSerial1.d \
./teensy4/HardwareSerial2.d \
./teensy4/HardwareSerial3.d \
./teensy4/HardwareSerial4.d \
./teensy4/HardwareSerial5.d \
./teensy4/HardwareSerial6.d \
./teensy4/HardwareSerial7.d \
./teensy4/HardwareSerial8.d \
./teensy4/IPAddress.d \
./teensy4/IntervalTimer.d \
./teensy4/Print.d \
./teensy4/Stream.d \
./teensy4/Tone.d \
./teensy4/WMath.d \
./teensy4/WString.d \
./teensy4/new.d \
./teensy4/usb_inst.d \
./teensy4/yield.d 


# Each subdirectory must supply rules for building sources it contributes
teensy4/%.o: ../teensy4/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C++ Compiler'
	arm-none-eabi-g++ -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -D__IMXRT1062__ -DTEENSYDUINO=148 -DARDUINO=10810 -DF_CPU=600000000 -DUSB_SERIAL -DLAYOUT_US_ENGLISH -I"/home/jonathan/git/Electrical-2019-2020/IMU_Interface/teensy4" -I"/home/jonathan/git/Electrical-2019-2020/IMU_Interface/ros_lib" -std=gnu++14 -fabi-version=0 -fno-exceptions -fno-rtti -fno-threadsafe-statics -fpermissive -felide-constructors -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

teensy4/%.o: ../teensy4/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -D__IMXRT1062__ -DTEENSYDUINO=148 -DARDUINO=10810 -DF_CPU=600000000 -DUSB_SERIAL -DLAYOUT_US_ENGLISH -I"/home/jonathan/git/Electrical-2019-2020/IMU_Interface/teensy4" -I"/home/jonathan/git/Electrical-2019-2020/IMU_Interface/ros_lib" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

teensy4/%.o: ../teensy4/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -x assembler-with-cpp -I"/home/jonathan/git/Electrical-2019-2020/IMU_Interface/teensy4" -I"/home/jonathan/git/Electrical-2019-2020/IMU_Interface/ros_lib" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


