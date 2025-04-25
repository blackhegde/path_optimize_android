import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final SharedPreferences prefs;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static const _tokenKey = 'auth_token';

  AuthService(this.prefs);

  // Đăng nhập
  Future<UserCredential> login(String email, String password) async {
    final userCred = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final token = await userCred.user?.getIdToken();
    if (token != null) {
      await prefs.setString(_tokenKey, token);
    }
    return userCred;
  }

  // Đăng ký
  Future<UserCredential> register(String email, String password) async {
    final userCred = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final token = await userCred.user?.getIdToken();
    if (token != null) {
      await prefs.setString(_tokenKey, token);
    }
    return userCred;
  }

  // Kiểm tra phiên
  Future<bool> checkPersistedSession() async {
    final user = _firebaseAuth.currentUser;
    final token = await user?.getIdToken();
    return user != null && token != null && token.isNotEmpty;
  }

  // Đăng xuất
  Future<void> logout() async {
    await _firebaseAuth.signOut();
    await prefs.remove(_tokenKey);
  }

  // Truy xuất token nếu cần
  String? getToken() => prefs.getString(_tokenKey);
}
