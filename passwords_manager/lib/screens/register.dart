import 'package:flutter/material.dart';
import 'package:passwords_manager/core/utils.dart';
import 'package:passwords_manager/theme/theme_constants.dart';
import 'package:passwords_manager/db/password-managerDB.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  String? _passwordError;

  @override
  void initState() {
    super.initState();

    confirmpasswordController.addListener(() {
      if (confirmpasswordController.text != passwordController.text) {
        setState(() {
          _passwordError = "Passwords do not match";
        });
      } else {
        setState(() {
          _passwordError = null;
        });
      }
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  void _showEmptyFieldPopup() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Missing Fields"),
            content: Text(
              "Please make sure to fill all the fields.",
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

  void _handleRegister() async {
    if (usernameController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        confirmpasswordController.text.trim().isEmpty) {
      _showEmptyFieldPopup();
      return;
    }

    if (passwordController.text != confirmpasswordController.text) {
      setState(() {
        _passwordError = "Passwords do not match";
      });
      return;
    }

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) =>
              Center(child: CircularProgressIndicator(color: primaryColor)),
    );

    await Future.delayed(Duration(seconds: 1));

    // Insert user into database
    await db.insertData('user', {
      'username': usernameController.text,
      'password': passwordController.text,
    });

    // Close loading dialog
    Navigator.of(context).pop();

    // Navigate to home
    Navigator.pushReplacementNamed(context, '/home');
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
                          'Register',
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPasswordField(
                        controller: confirmpasswordController,
                        label: 'Confirm Password',
                        hint: 'Confirm password',
                      ),
                      if (_passwordError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 12.0),
                          child: Text(
                            _passwordError!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ColoredButton(
                        text: 'Register',
                        whenPressed: _handleRegister,
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
