abstract class SessionManager {
  void saveSession(String token);
  String? getSession();
  void clearSession();
}
