class ApiConstants {
  // Use 10.0.2.2 for Android Emulator, localhost for iOS Simulator/Web
  // However, since we are likely testing on emulator or real device via IP:
  // For Android Emulator: 10.0.2.2
  // For Physical Device: LAN IP

  // Default to localhost for now, simpler for web/desktop if needed
  // But user asked for mobile.

  static const String baseUrl = "http://10.0.2.2:3000/api";
  // static const String baseUrl = "http://localhost:3000/api"; // For Web/iOS Sim

  static const String socketUrl = "http://10.0.2.2:3000";

  // Auth
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String me = "/auth/me";

  // Events
  static const String events = "/events";

  // Participants
  static String joinEvent(String eventId) => "/events/$eventId/join";

  // Chat content filtering checks are server-side, but UI might need endpoints?
  // No, chat is via WebSocket primarily.
}
