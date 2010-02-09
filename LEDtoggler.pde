/*
* LEDtoggler
* ==========
* Waits for control values to be sent via the serial connection and toggles LEDs on and off.
*
* After loading LEDtoggler to arduino, start the serial console and start to type the commands [0-4].
*
* The number of outputs can be trivially varied to suit your needs.
*
* Command   Responce
*   0     =  All LED's off
*   1     =  Toggle LED1 on/off
*   2     =  Toggle LED2 on/off
*   3     =  Toggle LED3 on/off
*   4     =  Toggle LED4 on/off
*   9     =  All LED's on
*
*
* Pin 5 --- 4,7K --- LED1 --- +5Volt
* Pin 6 --- 4,7K --- LED2 --- +5Volt
* Pin 7 --- 4,7K --- LED3 --- +5Volt
* Pin 8 --- 4,7K --- LED4 --- +5Volt
*
*
*
* Version:
* 2010-02-09  mk  Added "9" all LED's on.
*
*/

// Use pins 5 through 8 as the digital outputs
int pins[] = { 5, 6, 7, 8 };
int num_pins = 4;


/**
* Initial configuration
*/
void setup()
{
  Serial.begin(38400);             // Open the serial connection to listen for commands from the host
    int i;
    for (i = 0; i < num_pins; i++) // The array elements are numbered from 0 to num_pins - 1
        pinMode(pins[i], OUTPUT);  // Set each pin as an output
        digitalWrite(pins[i], LOW);
}


/**
* Main program loop
*/
void loop () {
  int light;
  int i;

  if(Serial.available()) {
     light = Serial.read();
     switch (light) {
        case '0':    // Turn all off
          Serial.println("All dark");
          for (i = 0; i < num_pins; i++) // The array elements are numbered from 0 to num_pins - 1
              digitalWrite(pins[i], HIGH);
          break;
        case '1':    // LED 1
          toggleLed1 ();
          break;
        case '2':    // LED 2
          toggleLed2 ();
          break;
        case '3':    // LED 3
          toggleLed3 ();
          break;
        case '4':    // LED 4
          toggleLed4 ();
          break;
        case '9':    // Turn all on
          Serial.println("All light");
          for (i = 0; i < num_pins; i++) // The array elements are numbered from 0 to num_pins - 1
              digitalWrite(pins[i], LOW);
          break;
     }
  }
}

void toggleLed1 () {
  int state;
  state = digitalRead (pins[0]);
  digitalWrite (pins[0], !state);
  Serial.println("LED 1");
}

void toggleLed2 () {
  int state;
  state = digitalRead (pins[1]);
  digitalWrite (pins[1], !state);
  Serial.println("LED 2");
}

void toggleLed3 () {
  int state;
  state = digitalRead (pins[2]);
  digitalWrite (pins[2], !state);
  Serial.println("LED 3");
}

void toggleLed4 () {
  int state;
  state = digitalRead (pins[3]);
  digitalWrite (pins[3], !state);
  Serial.println("LED 4");
}

