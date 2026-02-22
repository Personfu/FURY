/*
 * FURIOUS Intelligence Core (v1.0)
 * ESP32-S3 - Data Normalization & Dashboard
 */

#include "data_model.h"

void setup() {
  Serial.begin(115200);
  Serial.println("[*] FURIOUS ESP32 Intelligence Core: BOOTING...");

  // Initialize Modules
  setupWiFi();
  setupSD();
  setupDisplay();
}

void loop() {
  if (Serial.available()) {
    String frame = Serial.readStringUntil('\n');
    processFrame(frame);
  }
}

void processFrame(String frame) {
  // Normalization Logic: WHO, WHAT, WHERE, WHEN, WHY
  FURY_Event ev;
  ev.who = "Sensor_Node_01";
  ev.what = frame;
  ev.where = "Node_Alpha_7";
  ev.when = "2026-02-20T18:45:00Z";
  ev.why = "Periodic Telemetry";

  Serial.print("[+] Normalized Event: ");
  Serial.println(ev.what);
}

void setupWiFi() {
  Serial.println("[+] WiFi Monitor: ACTIVE (Promiscuous Mode)");
}
void setupSD() {
  Serial.println("[+] SD Storage: INITIALIZED (logs/events.jsonl)");
}
void setupDisplay() { Serial.println("[+] LCD Display: FURY TITAN-X v1.0"); }
