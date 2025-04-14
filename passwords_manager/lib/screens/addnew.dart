import 'package:flutter/material.dart';
import 'package:passwords_manager/core/utils.dart';
import 'package:passwords_manager/db/password-managerDB.dart';
import 'package:passwords_manager/theme/theme_constants.dart';

class Addnew extends StatefulWidget {
  const Addnew({super.key});

  @override
  State<Addnew> createState() => _AddnewState();
}

class _AddnewState extends State<Addnew> {
  TextEditingController accountnameCtrl = TextEditingController();
  TextEditingController accountemailCtrl = TextEditingController();
  TextEditingController accountpasswordCtrl = TextEditingController();

  void showMissingFieldsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Incomplete Fields",
            style: TextStyle(
              color: primaryColor,
              fontSize: 16,
              fontFamily: 'BabasNeue',
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Text(
            "Please fill in all fields before submitting.",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void addAccount() async {
    if (accountnameCtrl.text.trim().isEmpty ||
        accountemailCtrl.text.trim().isEmpty ||
        accountpasswordCtrl.text.trim().isEmpty) {
      showMissingFieldsDialog();
      return;
    }

    await db.insertData('accounts', {
      'name': accountnameCtrl.text.trim(),
      'password': accountpasswordCtrl.text.trim(),
      'email': accountemailCtrl.text.trim(),
      'date': DateTime.now().toIso8601String().split('T')[0],
      'generated': 0,
    });

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text(
                        'ADD NEW',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 100),
                      AddRows(
                        title: 'NAME',
                        description: 'Enter account name',
                        controller: accountnameCtrl,
                      ),
                      const SizedBox(height: 40),
                      AddRows(
                        title: 'EMAIL/USERNAME',
                        description: 'Enter email/username',
                        controller: accountemailCtrl,
                      ),
                      const SizedBox(height: 40),
                      AddRows(
                        title: 'PASSWORD',
                        description: 'Enter password',
                        controller: accountpasswordCtrl,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: BorderedButton(
                              text: 'Generate new',
                              whenPressed: () {
                                Navigator.pushNamed(context, '/generatenew');
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ColoredButton(text: 'Add new', whenPressed: addAccount),
        ),
      ),
    );
  }
}
