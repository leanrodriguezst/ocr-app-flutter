import 'package:ocr_app_flutter/core/usecases/interfaces/session_manager.dart';

class SessionManagerImpl extends SessionManager {
  String? _token;

  SessionManagerImpl([this._token]);

  @override
  void clearSession() {
    _token = null;
  }

  @override
  String? getSession() {
    return _token;
  }

  @override
  void saveSession(String token) {
    _token = token;
  }
}
