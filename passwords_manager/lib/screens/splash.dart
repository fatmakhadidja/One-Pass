import 'package:flutter/material.dart';
import 'package:passwords_manager/theme/theme_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(), // Pushes everything below it down
          Center(
            child: Column(
              children: [
                Image.asset('assets/images/logo.png'),
                SizedBox(height: 10),
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
              ],
            ),
          ),
          Spacer(), // Pushes the text below to the bottom
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
    );
  }
}
