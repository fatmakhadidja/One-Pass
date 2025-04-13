import 'package:flutter/material.dart';
import 'package:passwords_manager/core/utils.dart';
import 'package:passwords_manager/theme/theme_constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController myController1 = TextEditingController();
  TextEditingController myController2 = TextEditingController();

  void _showEmptyFieldPopup() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Missing Fields"),
            content: Text("Please fill in both username and password.",style: Theme.of(context).textTheme.headlineSmall,),
            actions: [
              TextButton(
                child: Text("OK", style: TextStyle(color: primaryColor)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
    );
  }

  void _handleLogin() {
    if (myController1.text.trim().isEmpty ||
        myController2.text.trim().isEmpty) {
      _showEmptyFieldPopup();
    } else {
      // Proceed with login
      print("Username: ${myController1.text}");
      print("Password: ${myController2.text}");
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
                          'Login',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Let’s get you setup with a new account!',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    controller: myController1,
                    label: 'Username',
                    hint: 'Enter Username',
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomPasswordField(
                    controller: myController2,
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
