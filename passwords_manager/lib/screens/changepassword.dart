import 'package:flutter/material.dart';
import 'package:passwords_manager/core/utils.dart';
import 'package:passwords_manager/db/password-managerDB.dart';
import 'package:passwords_manager/theme/theme_constants.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  TextEditingController CurrentPasswordCtrl = TextEditingController();
  TextEditingController NewPasswordCtrl = TextEditingController();

  void _showDialog({
    required String title,
    required String content,
    VoidCallback? onOkPressed,
  }) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              title,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontFamily: 'BabasNeue',
                fontWeight: FontWeight.w500,
              ),
            ),
            content: Text(
              content,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              TextButton(
                child: const Text("OK", style: TextStyle(color: primaryColor)),
                onPressed: onOkPressed ?? () => Navigator.of(context).pop(),
              ),
            ],
          ),
    );
  }

  void changePassword() async {
    List<Map> user = await db.getData("SELECT * FROM user LIMIT 1");

    final current = CurrentPasswordCtrl.text.trim();
    final newPass = NewPasswordCtrl.text.trim();

    if (current.isEmpty || newPass.isEmpty) {
      _showDialog(
        title: "Missing Fields",
        content: "Please fill in both current and new password.",
      );
    } else if (user[0]['password'] == current) {
      await db.updateData(
        'user',
        {'password': newPass},
        'password = ?',
        [current],
      );
      _showDialog(
        title: "Password changed successfully!",
        content: "Press OK to continue",
        onOkPressed: () => Navigator.pushReplacementNamed(context, '/home'),
      );
    } else {
      _showDialog(
        title: "Wrong current password",
        content: "Please enter the right password.",
      );
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: primaryColor,
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
                          'Reset password',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomPasswordField(
                    controller: CurrentPasswordCtrl,
                    label: 'Current Password',
                    hint: 'Enter Current Password',
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomPasswordField(
                    controller: NewPasswordCtrl,
                    label: 'New Password',
                    hint: 'Enter new password',
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ColoredButton(
                    text: 'Reset Password',
                    whenPressed: () {
                      changePassword();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
