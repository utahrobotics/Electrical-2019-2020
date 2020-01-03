#define __AVR_ATtiny84__

#include <Arduino.h>
#include "TinyWireS.h"                          // I2C library for ATtiny84A (and other older ATtinys)


// --------------------------------------
// Slave
//    
// This sketch is for the ATTINY84 on-board a USR 2019-2020 Power Node V2.0. Upon request from a master device the ATTINY will take readings from the voltage divider
// and ACS712 current sensor and send a total of four bytes (two for each integer reading, first current then voltage) to the master device.
// The program also handles a shift register to display readings continuously. Use the slide switch to switch between displaying amps and volts
//
// By: Alex Charters
// Last Updated: 2/23/2019 

#define I2C_SLAVE_ADDRESS 0x5 // Address of the slave
#define DS_pin 8
#define latch_pin 10
#define shift_pin 9
#define currentmeasure A3 // define the Arduino pin A0 as voltage input (V in)
#define voltagemeasure A7
#define switchpin 1
#define potpin A5
#define decpin 0

const float VCC   = 5.0;// supply voltage is from 4.5 to 5.5V. Normally 5V.
const int model = 1;   // enter the model number (see below)

float cutOffLimit = 1.01;// set the current which below that value, doesn't matter. Or set 0.5

/*
          "ACS712ELCTR-05B-T",// for model use 0
          "ACS712ELCTR-20A-T",// for model use 1
          "ACS712ELCTR-30A-T"// for model use 2  
sensitivity array is holding the sensitivy of the  ACS712
current sensors. Do not change. All values are from page 5  of data sheet          
*/
float sensitivity[] ={
          0.185,// for ACS712ELCTR-05B-T
          0.100,// for ACS712ELCTR-20A-T
          0.066// for ACS712ELCTR-30A-T
     
         }; 


const float QOV =   0.5 * VCC;// set quiescent Output voltage of 0.5V
float voltage;// internal variable for voltage


int i=0;
 
void setup()
{
    TinyWireS.begin(I2C_SLAVE_ADDRESS); // join i2c network
    //TinyWireS.onReceive(receiveEvent); // not using this
    TinyWireS.onRequest(requestEvent);
 
    // Turn on LED when program starts
    pinMode(currentmeasure, INPUT); //current
    pinMode(voltagemeasure, INPUT); //voltage
    
    pinMode(DS_pin, OUTPUT);
    pinMode(latch_pin, OUTPUT);
    pinMode(shift_pin, OUTPUT);
}
 
void loop()
{
    // This needs to be here
    TinyWireS_stop_check();

    int cur_val=analogRead(currentmeasure);
    int volt_val = analogRead(voltagemeasure);
    int adjustval = analogRead(potpin);
    int desiredval = map(adjustval, 0, 255, -5, 5);
    if(digitalRead(switchpin)){
        //Robojax.com ACS712 Current Sensor 
        float voltage_raw =  ((5.0 / 1023.0)* cur_val) + desiredval;// Read the voltage from sensor
        voltage =  voltage_raw - QOV + 0.012 ;// 0.000 is a value to make voltage zero when there is no current
        float current = voltage / sensitivity[model];
    
        writeRegNum(current);
    }
    else{
        float voltage = (volt_val * (5.0 / 1023.0))*5;
        writeRegNum(voltage);
    }
}
 
// Gets called when the ATtiny receives an i2c request
void requestEvent()
{
    int adjustval = analogRead(potpin);
    int desiredval = map(adjustval, 0, 255, -5, 5);
    //current
    int cur_val=analogRead(currentmeasure) + desiredval;
    byte valLow = cur_val & 0xff;
    byte valHigh = (cur_val >> 8);

    //voltage
    int volt_val = analogRead(voltagemeasure);
    
    byte voltLow = volt_val & 0xff;
    byte voltHigh = (volt_val >> 8);

    //sending
    TinyWireS.write(valHigh);
    TinyWireS.write(valLow);
    TinyWireS.write(voltHigh);
    TinyWireS.write(voltLow);
}

void writeRegNum(float num){
    if(num!=0.0){
     int numOne = 0;
     int numTwo = 0;
     bool decimal = false;
    if(num >= 10){
     int intNum = int(num);
     numOne = (intNum/10)%10;
     numTwo = intNum%10;
     digitalWrite(decpin, LOW);
    }
    else{
      digitalWrite(decpin, HIGH);
      char result[3];
      dtostrf(num, 3, 2, result);
      numOne = String(result[0]).toInt();
      numTwo = String(result[2]).toInt();
      decimal = true;
    }

    int arr[8];
    for(int i = 0; i<4; i++){
      arr[i] = bitRead(numOne, i);
    }
    for(int i = 0; i<4; i++){
      arr[i+4] = bitRead(numTwo, i);
    }
  
    digitalWrite(latch_pin, LOW);
  
    for(int i = 7; i>=0; i--){
      digitalWrite(shift_pin, LOW);
      digitalWrite(DS_pin, arr[i]);
      digitalWrite(shift_pin, HIGH);
    }
    digitalWrite(latch_pin, HIGH);
  }
}
