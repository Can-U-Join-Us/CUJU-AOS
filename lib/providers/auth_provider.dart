import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  static final secureStorage = FlutterSecureStorage();
  String? auth;

  bool get isAuth {
    checkAuthenticate();
    return auth != null;
  }

  // 1. 로그인
  Future<void> login() async {
    auth = "register";
    await secureStorage.write(key: "auth", value: "register");
    notifyListeners();
  }

  // 2. 로그아웃
  Future<void> logout() async {
    auth = null;
    await secureStorage.delete(key: "auth");
    notifyListeners();
  }

  // 3. 회원가입

  // 4. 로그인 여부 확인
  Future<void> checkAuthenticate() async {
    auth = await secureStorage.read(key: "auth");
  }
}
