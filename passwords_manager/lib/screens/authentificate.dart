import 'package:flutter/material.dart';
import 'package:passwords_manager/core/utils.dart';
import 'package:passwords_manager/theme/theme_constants.dart';
import 'package:passwords_manager/db/password-managerDB.dart';

class Authentificate extends StatefulWidget {
  const Authentificate({super.key});

  @override
  State<Authentificate> createState() => _AuthentificateState();
}

class _AuthentificateState extends State<Authentificate> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _showEmptyFieldPopup() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Missing Fields"),
            content: Text(
              "Please fill in both username and password.",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            actions: [
              TextButton(
                child: Text("OK", style: TextStyle(color: primaryColor)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
    );
  }

  void _handleLogin() async {
    if (usernameController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      _showEmptyFieldPopup();
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (context) =>
                Center(child: CircularProgressIndicator(color: primaryColor)),
      );

      // Wait 2 seconds
      await Future.delayed(Duration(seconds: 1));

      // Insert user into database
      List<Map> user = await db.getData("SELECT * FROM user LIMIT 1");
      if (user[0]['username'] == usernameController.text &&
          user[0]['password'] == passwordController.text) {
        Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text("Wrong credentials"),
                content: Text(
                  "Try again.",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                actions: [
                  TextButton(
                    child: Text("OK", style: TextStyle(color: primaryColor)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          'Get In',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Let’s get you secured now!',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    controller: usernameController,
                    label: 'Username',
                    hint: 'Enter Username',
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomPasswordField(
                    controller: passwordController,
                    label: 'Password',
                    hint: 'Enter password',
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ColoredButton(
                        text: 'Login',
                        whenPressed: _handleLogin,
                      ),
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
