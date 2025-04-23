import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();
  final authService = AuthService(prefs);
  final isLoggedIn = await authService.checkPersistedSession();

  runApp(
    MyApp(authService: authService, initialRoute: isLoggedIn ? '/home' : '/'),
  );
}

class MyApp extends StatelessWidget {
  final AuthService authService;
  final String initialRoute;

  const MyApp({
    super.key,
    required this.authService,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Path Optimization',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      initialRoute: initialRoute,
      routes: {
        '/': (context) => AuthScreen(authService: authService),
        '/home': (context) => HomeScreen(authService: authService),
      },
    );
  }
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final SharedPreferences _prefs;

  AuthService(this._prefs);

  Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await _prefs.setString('user_email', email);
      await _prefs.setBool('is_logged_in', true);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkPersistedSession() async {
    return _prefs.getBool('is_logged_in') ?? false;
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _prefs.clear();
  }
}
