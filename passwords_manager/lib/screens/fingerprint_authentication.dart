import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import 'package:passwords_manager/theme/theme_constants.dart';
import '../core/utils.dart';

class FingerprintAuthPage extends StatefulWidget {
  @override
  _FingerprintAuthPageState createState() => _FingerprintAuthPageState();
}

class _FingerprintAuthPageState extends State<FingerprintAuthPage> {
  final LocalAuthentication auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                          child: Row(
                            children: [
                              Text(
                                'Skip',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'BabasNeue',
                                ), // Customize text color
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.arrow_right_alt, color: primaryColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: RichText(
                        text: TextSpan(
                          text: 'ENABLE\n',
                          style: Theme.of(context).textTheme.headlineLarge,
                          children: [
                            TextSpan(
                              text: 'FINGERPRINT\n',
                              style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'BabasNeue',
                                fontSize: 64,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: 'LOGIN.',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        'Skip the typing. Secure your access with just a touch. OneTap Login keeps your data safe and gets you in faster.',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColoredButton(
                      text: 'Login with fingerprint',
                      whenPressed: () {
                        authenticate(context, auth);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
