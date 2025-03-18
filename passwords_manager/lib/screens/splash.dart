import 'package:flutter/material.dart';
import 'package:passwords_manager/theme/theme_constants.dart';
import 'homescreen.dart';
import 'onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3)); // Splash delay

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    // if (hasSeenOnboarding) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => const HomeScreen()),
    //   );
    // } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Onboarding()),
    );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'ONE ',
                      style: TextStyle(
                        color: primaryColor,
                        fontFamily: 'BabasNeue',
                        fontWeight: FontWeight.normal,
                        fontSize: 24,
                      ),
                      children: [
                        TextSpan(
                          text: 'PASS',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballRotateChase,
                      colors: const [Color(0xffBABABA), primaryColor],
                    ),
                  ),
                ],
              ),
            ),

            // This stays at the bottom
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'The only password manager you’ll ever need.',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
