import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:passwords_manager/screens/addnew.dart';
import 'package:passwords_manager/screens/fingerprint_authentication.dart';
import 'package:passwords_manager/screens/generatenew.dart';
import 'package:passwords_manager/screens/homescreen.dart';
import 'package:passwords_manager/screens/register.dart';

import 'package:passwords_manager/theme/theme_constants.dart';
import 'package:passwords_manager/theme/theme_manager.dart';
import 'screens/splash.dart';
import 'screens/changepassword.dart';
import 'screens/authentificate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top],
  );
  await themeManager.loadTheme();
  runApp(const MyApp());
}

ThemeManager themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    themeManager.addListener(themeListner);
    super.initState();
  }

  themeListner() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    themeManager.removeListener(themeListner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomeScreen(),

        '/addnew': (context) => Addnew(),
        '/generatenew': (context) => Generatenew(),
        '/changePassword': (context) => Changepassword(),
        '/authentificate': (context) => Authentificate(),
        '/register': (context) => Register(),
        '/fingerprint': (context) => FingerprintAuthPage(),
      },

      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      home: SplashScreen(),
    );
  }
}
