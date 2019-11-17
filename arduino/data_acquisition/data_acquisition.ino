#include <Wire.h>
#include <Adafruit_INA219.h>

Adafruit_INA219 ina219;

float t = 0.0;
const float st = 10.0;
String input;

void setup() {
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);
  pinMode(7, INPUT);
  pinMode(8, INPUT);
  pinMode(9, INPUT);
  pinMode(10, INPUT);
  pinMode(11, INPUT);
  pinMode(12, OUTPUT);
  pinMode(13, OUTPUT);
  
  Serial.begin(115200);
  ina219.begin();
  reset();
}

void loop() {
  if (Serial.available() > 0){
    input = Serial.readStringUntil('\n');
    if (input.equals("RESET")) reset();
  }
  
  delay(st/2);
  digitalWrite(13, HIGH);
  delay(st/2);
  digitalWrite(13, LOW);
  t += st / 1000.0; 
  printData(t);
}

void printData(float t) {
  int Q9 = digitalRead(2);
  int Q8 = digitalRead(3);
  int Q7 = digitalRead(4);
  int Q6 = digitalRead(5);
  int Q5 = digitalRead(6);
  int Q4 = digitalRead(7);
  int Q3 = digitalRead(8);
  int Q2 = digitalRead(9);
  int Q1 = digitalRead(10);
  int Q0 = digitalRead(11);
  
  float shuntvoltage = ina219.getShuntVoltage_mV();
  float busvoltage = ina219.getBusVoltage_V();
  float current_mA = ina219.getCurrent_mA();
  current_mA = abs(current_mA);
  float loadvoltage = busvoltage + (shuntvoltage / 1000);
  float power = current_mA * loadvoltage;
  
  Serial.println((String) t + "," + 
                 (String) Q9 + 
                 (String) Q8 + 
                 (String) Q7 + 
                 (String) Q6 + 
                 (String) Q5 + 
                 (String) Q4 + 
                 (String) Q3 + 
                 (String) Q2 + 
                 (String) Q1 + 
                 (String) Q0 + "," + 
                 (String) power); 
}

void reset() {
  t = 0.0;
  digitalWrite(12, HIGH);
  delay(st/2);
  digitalWrite(12, LOW);
  delay(st/2);
  printData(t);
}

