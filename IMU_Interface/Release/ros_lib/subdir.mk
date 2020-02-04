################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../ros_lib/duration.cpp \
../ros_lib/time.cpp 

OBJS += \
./ros_lib/duration.o \
./ros_lib/time.o 

CPP_DEPS += \
./ros_lib/duration.d \
./ros_lib/time.d 


# Each subdirectory must supply rules for building sources it contributes
ros_lib/%.o: ../ros_lib/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C++ Compiler'
	arm-none-eabi-g++ -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -D__IMXRT1062__ -DTEENSYDUINO=148 -DARDUINO=10810 -DF_CPU=600000000 -DUSB_SERIAL -DLAYOUT_US_ENGLISH -I"/home/jonathan/git/Electrical-2019-2020/IMU_Interface/teensy4" -I"/home/jonathan/git/Electrical-2019-2020/IMU_Interface/ros_lib" -std=gnu++14 -fabi-version=0 -fno-exceptions -fno-rtti -fno-threadsafe-statics -fpermissive -felide-constructors -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


