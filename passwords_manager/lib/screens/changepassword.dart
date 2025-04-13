import 'package:flutter/material.dart';
import 'package:passwords_manager/core/utils.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Reset password',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomPasswordField(
                controller: myController,
                label: 'Reset Password',
                hint: 'Enter new password',
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ColoredButton(text: 'Reset Password', whenPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
