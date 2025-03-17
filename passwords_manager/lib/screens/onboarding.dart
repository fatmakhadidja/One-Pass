import 'package:flutter/material.dart';
import 'package:passwords_manager/main.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "button",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),

            Switch(
              value: themeManager.themeMode == ThemeMode.dark,
              onChanged: (value) {
                setState(() {
                  themeManager.toggleTheme(value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
