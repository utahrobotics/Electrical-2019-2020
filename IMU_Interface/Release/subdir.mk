################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../main.cpp 

OBJS += \
./main.o 

CPP_DEPS += \
./main.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.cpp subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C++ Compiler'
	arm-none-eabi-g++ -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall  -g -D__IMXRT1062__ -DTEENSYDUINO=148 -DARDUINO=10810 -DF_CPU=600000000 -DUSB_SERIAL -DLAYOUT_US_ENGLISH -I"/home/jonathan/git/Electrical-2019-2020/IMU_Interface/teensy4" -I"/home/jonathan/git/Electrical-2019-2020/IMU_Interface/ros_lib" -std=gnu++14 -fabi-version=0 -fno-exceptions -fno-rtti -fno-threadsafe-statics -fpermissive -felide-constructors -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


