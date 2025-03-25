import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:passwords_manager/main.dart';
import 'package:passwords_manager/theme/theme_constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'PROFILE',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            ProfileButton(
              buttonText: 'Change your main password',
              icon: Icons.lock,
              function: () async {},
            ),
            ProfileButton(
              buttonText: 'Switch mode',
              icon:
                  themeManager.themeMode == ThemeMode.light
                      ? Icons.dark_mode
                      : Icons.light_mode,
              function: () async {
                await themeManager.toggleTheme(
                  themeManager.themeMode == ThemeMode.dark,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileButton extends StatefulWidget {
  final Future<void> Function() function;
  final String buttonText;
  final IconData icon;

  const ProfileButton({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.function,
  });

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await themeManager.toggleTheme(
          themeManager.themeMode == ThemeMode.dark,
        );
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(widget.icon, color: primaryColor),
          SizedBox(width: 10),
          Text(
            widget.buttonText,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}

Future<void> myAsyncFunction() async {}
