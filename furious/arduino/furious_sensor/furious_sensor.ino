/*
 * FURIOUS Sensor Node (v1.0)
 * Arduino Uno - Sensor Acquisition & L-SPP Framing
 */

#define BAUDRATE 115200

void setup() {
  Serial.begin(BAUDRATE);
  while (!Serial) {
    ;
  }
  Serial.println("[*] FURIOUS Arduino Sensor Node: ONLINE");
}

void loop() {
  // Simulate sensor acquisition
  int temp = 24 + random(-2, 3);
  int hum = 45 + random(-5, 6);
  int sig = random(0, 1024);

  // Format data using L-SPP v1.0 framed protocol
  // Structure: [TYPE:DATA,S1:VAL,S2:VAL,CHK:HEX]
  Serial.print("[SIG:DATA,T:");
  Serial.print(temp);
  Serial.print(",H:");
  Serial.print(hum);
  Serial.print(",S:");
  Serial.print(sig);

  // Simple checksum simulation
  int checksum = (temp + hum + sig) % 256;
  Serial.print(",CHK:");
  Serial.print(checksum, HEX);
  Serial.println("]");

  delay(2000); // Polling interval
}
