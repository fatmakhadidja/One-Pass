import 'package:flutter/material.dart';
import 'package:passwords_manager/screens/accountdetails.dart';
import 'package:passwords_manager/screens/addnew.dart';
import 'package:passwords_manager/screens/generatenew.dart';
import 'package:passwords_manager/screens/homescreen.dart';
import 'package:passwords_manager/screens/splash.dart';
import 'package:passwords_manager/screens/update.dart';
import 'package:passwords_manager/theme/theme_constants.dart';
import 'package:passwords_manager/theme/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        '/accountdetails': (context) => Accountdetails(),
        '/update': (context) => Update(),
        '/addnew': (context) => Addnew(),
        '/generatenew': (context) => Generatenew(),
      },
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      home: SplashScreen(),
    );
  }
}
