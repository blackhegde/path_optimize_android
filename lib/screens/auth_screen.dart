import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  final AuthService authService;
  const AuthScreen({super.key, required this.authService});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

// // Lớp AuthService luu phien dang nhap
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final SharedPreferences _prefs;

//   AuthService(this._prefs);

//   // Đăng nhập và lưu trạng thái
//   Future<bool> login(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       await _prefs.setString('user_email', email);
//       await _prefs.setBool('is_logged_in', true);
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   // Kiểm tra phiên khi khởi động app
//   Future<bool> checkPersistedSession() async {
//     return _prefs.getBool('is_logged_in') ?? false;
//   }

//   // Đăng xuất và xóa dữ liệu
//   Future<void> logout() async {
//     await _auth.signOut();
//     await _prefs.clear();
//   }
// }

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true; // Chuyển đổi giữa đăng nhập/đăng ký
  String _email = '';
  String _password = '';
  bool _isLoading = false;

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    setState(() => _isLoading = true);

    try {
      if (_isLogin) {
        await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        // Thông báo đăng nhập thành công
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đăng nhập thành công!'),
            backgroundColor: Colors.green,
          ),
        );
        // Chuyển sang màn hình chính sau 2 giây
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, '/home');
        });
      } else {
        await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đăng ký thành công!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Đã xảy ra lỗi'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    _isLogin ? 'Đăng nhập' : 'Đăng ký',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Email không hợp lệ!';
                      }
                      return null;
                    },
                    onSaved: (value) => _email = value!.trim(),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Mật khẩu'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu';
                      }
                      if (value.length < 6 || value.length > 15) {
                        return 'Mật khẩu phải từ 6-15 ký tự';
                      }
                      if (!value.contains(RegExp(r'[A-Z]'))) {
                        return 'Cần ít nhất 1 chữ in hoa';
                      }
                      if (!value.contains(RegExp(r'[a-z]'))) {
                        return 'Cần ít nhất 1 chữ thường';
                      }
                      if (!value.contains(RegExp(r'[0-9]'))) {
                        return 'Cần ít nhất 1 số';
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value!,
                  ),
                  const SizedBox(height: 20),
                  if (_isLoading)
                    const CircularProgressIndicator()
                  else
                    ElevatedButton(
                      onPressed: _submit,
                      child: Text(_isLogin ? 'Đăng nhập' : 'Đăng ký'),
                    ),
                  TextButton(
                    onPressed: () => setState(() => _isLogin = !_isLogin),
                    child: Text(
                      _isLogin
                          ? 'Chưa có tài khoản? Đăng ký ngay'
                          : 'Đã có tài khoản? Đăng nhập',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
