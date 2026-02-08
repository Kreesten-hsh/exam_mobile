class ApiConstants {
  // Use 192.168.1.69 for physical device, or 10.0.2.2 for emulator
  // I will use the IP provided in the prompt context but allow easy switching
  static const String baseUrl = 'http://192.168.1.68:3000/api';

  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String me = '/auth/me';
  static const String events = '/events';
  static String joinEvent(String id) => '/events/$id/register';
  static String participants(String id) => '/events/$id/participants';
}
