/*
 * FURY Data Model (v1.0)
 * Unified Event Structure
 */

struct FURY_Event {
  const char *who;   // Subject/Sensor ID
  String what;       // Raw/Normalized Data
  const char *where; // Geolocation/Node Context
  const char *when;  // Timestamp
  const char *why;   // Event Trigger/Category
};
