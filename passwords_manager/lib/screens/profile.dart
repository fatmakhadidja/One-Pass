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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  'PROFILE',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileButton(
                onPress: () {
                  Navigator.pushNamed(context, '/changePassword');
                },
                buttonText: 'Change your main password',
                prefix: Icon(Icons.lock, color: primaryColor),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Switch(
                    value: themeManager.themeMode == ThemeMode.dark,
                    onChanged: (bool isDark) async {
                      await themeManager.toggleTheme(isDark);
                      setState(() {});
                    },
                    activeColor: primaryColor,
                    activeTrackColor: Color.fromARGB(255, 235, 182, 182),
                    inactiveThumbColor: secondaryColor,
                    inactiveTrackColor: Colors.white,
                    splashRadius: 20.0,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Switch mode',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileButton extends StatefulWidget {
  final String buttonText;
  final Widget prefix;
  final Function() onPress;

  const ProfileButton({
    super.key,
    required this.buttonText,
    required this.prefix,
    required this.onPress,
  });

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.prefix,
          // Icon(widget.icon, color: primaryColor),
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
