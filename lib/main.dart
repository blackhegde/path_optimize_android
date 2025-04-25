import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'services/auth_service.dart';

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
      // ❌ KHÔNG dùng `home:` nếu dùng `initialRoute` và `routes`
      initialRoute: initialRoute,
      routes: {
        '/': (context) => AuthScreen(authService: authService),
        '/home': (context) => HomeScreen(authService: authService),
      },
    );
  }
}
