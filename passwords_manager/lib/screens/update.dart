import 'package:flutter/material.dart';
import 'package:passwords_manager/core/utils.dart';
import 'package:passwords_manager/db/password-managerDB.dart';
import 'package:passwords_manager/theme/theme_constants.dart';

class Update extends StatefulWidget {
  final int accountId;
  const Update({super.key, required this.accountId});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController accountNameCtrl = TextEditingController();
  TextEditingController accountEmailCtrl = TextEditingController();
  TextEditingController accountPasswordCtrl = TextEditingController();
  List<Map<String, dynamic>> account = [];

  @override
  void initState() {
    super.initState();
    fetchAccount();
  }

  void fetchAccount() async {
    account = await db.getData(
      "SELECT * FROM accounts WHERE id = ${widget.accountId}",
    );
    setState(() {});
  }

  void updateAccount() async {
    if (account.isEmpty) return;

    final existing = account[0];

    final updatedData = {
      'name':
          accountNameCtrl.text.trim().isEmpty
              ? existing['name']
              : accountNameCtrl.text.trim(),
      'email':
          accountEmailCtrl.text.trim().isEmpty
              ? existing['email']
              : accountEmailCtrl.text.trim(),
      'password':
          accountPasswordCtrl.text.trim().isEmpty
              ? existing['password']
              : accountPasswordCtrl.text.trim(),
    };

    await db.updateData('accounts', updatedData, 'id = ?', [widget.accountId]);

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 15),
                child:
                    account.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
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
                                'UPDATE',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              const SizedBox(height: 100),
                              AddRows(
                                title: 'NAME',
                                description: account[0]['name'],
                                controller: accountNameCtrl,
                              ),
                              const SizedBox(height: 40),
                              AddRows(
                                title: 'EMAIL/USERNAME',
                                description: account[0]['email'],
                                controller: accountEmailCtrl,
                              ),
                              const SizedBox(height: 40),
                              AddRows(
                                title: 'PASSWORD',
                                description: account[0]['password'],
                                controller: accountPasswordCtrl,
                              ),
                              const SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: BorderedButton(
                                      text: 'Generate password',
                                      whenPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/generatenew',
                                        );
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
          child: ColoredButton(
            text: 'Save changes',
            whenPressed: updateAccount,
          ),
        ),
      ),
    );
  }
}
