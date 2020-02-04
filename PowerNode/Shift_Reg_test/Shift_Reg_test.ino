
#define DS_pin 8
#define latch_pin 10
#define shift_pin 9
#define decpin 0

void setup() {
  // put your setup code here, to run once:
  pinMode(DS_pin, OUTPUT);
  pinMode(latch_pin, OUTPUT);
  pinMode(shift_pin, OUTPUT);
  pinMode(decpin, OUTPUT);
}

void loop() {
  writeRegNum(7.7);
}

void writeRegNum(float num){
    int numOne = 0;
    int numTwo = 0;
    if(num==0.0){
     numOne = 0;
     numTwo = 0;
     digitalWrite(decpin, LOW);
    }
    else if(num >= 10){
     int intNum = int(num);
     numOne = (intNum/10)%10;
     numTwo = intNum%10;
     digitalWrite(decpin, LOW);
    }
    else{
      digitalWrite(decpin, HIGH);
      char result[3];
      dtostrf(num, 8, 4, result);
      numOne = String(result[0]).toInt();
      numTwo = String(result[2]).toInt();
    }

    int arr[8];
    for(int i = 0; i<4; i++){
      arr[i] = bitRead(numOne, i);
    }
    for(int i = 0; i<4; i++){
      arr[i+4] = bitRead(numTwo, i);
    }
  
    digitalWrite(latch_pin, 0);
    shiftOut(DS_pin, shift_pin, bitsToByte(arr));

    digitalWrite(latch_pin, 1);
  }

  // the heart of the program
void shiftOut(int myDataPin, int myClockPin, byte myDataOut) {
  // This shifts 8 bits out MSB first,
  //on the rising edge of the clock,
  //clock idles low
  
  //Serial.println(myDataOut,BIN);

  //internal function setup
  int i=0;
  int pinState;
  pinMode(myClockPin, OUTPUT);
  pinMode(myDataPin, OUTPUT);

  //clear everything out just in case to
  //prepare shift register for bit shifting
  digitalWrite(myDataPin, 0);
  digitalWrite(myClockPin, 0);

  //for each bit in the byte myDataOut�
  //NOTICE THAT WE ARE COUNTING DOWN in our for loop
  //This means that %00000001 or "1" will go through such
  //that it will be pin Q0 that lights.
  for (i=7; i>=0; i--)  {
    digitalWrite(myClockPin, 0);
    digitalWrite(latch_pin, 0);

    //if the value passed to myDataOut and a bitmask result
    // true then... so if we are at i=6 and our value is
    // %11010100 it would the code compares it to %01000000
    // and proceeds to set pinState to 1.
    
    if ( myDataOut & (1<<i) ) {
      pinState= 1;
    }
    else { 
      pinState= 0;
    }

    //Sets the pin to HIGH or LOW depending on pinState
    digitalWrite(myDataPin, pinState);
    //register shifts bits on upstroke of clock pin  
    digitalWrite(myClockPin, 1);
    //zero the data pin after shift to prevent bleed through
    digitalWrite(myDataPin, 0);
    //digitalWrite(latch_pin, 1);
  }

  //stop shifting
  digitalWrite(myClockPin, 0);
}

byte bitsToByte(int bits[])
{
  byte sum = 0x00;
  for(int i = 0; i < 8; i++)
  {
    sum<<=1;
    sum |= bits[i];
  }
  return sum;
}




char * dtostrf(double number, signed char width, unsigned char prec, char *s) {

    if(isnan(number)) {
        strcpy(s, "nan");
        return s;
    }
    if(isinf(number)) {
        strcpy(s, "inf");
        return s;
    }

    if(number > 4294967040.0 || number < -4294967040.0) {
        strcpy(s, "ovf");
        return s;
    }
    char* out = s;
    // Handle negative numbers
    if(number < 0.0) {
        *out = '-';
        ++out;
        number = -number;
    }

    // Round correctly so that print(1.999, 2) prints as "2.00"
    double rounding = 0.5;
    for(uint8_t i = 0; i < prec; ++i)
        rounding /= 10.0;

    number += rounding;

    // Extract the integer part of the number and print it
    unsigned long int_part = (unsigned long) number;
    double remainder = number - (double) int_part;
    out += sprintf(out, "%d", int_part);

    // Print the decimal point, but only if there are digits beyond
    if(prec > 0) {
        *out = '.';
        ++out;
    }

    while(prec-- > 0) {
        remainder *= 10.0;
    }
    sprintf(out, "%d", (int) remainder);

    return s;
}
