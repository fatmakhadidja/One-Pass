// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:passwords_manager/core/utils.dart';
import 'package:passwords_manager/db/password-managerDB.dart';
import 'package:passwords_manager/screens/update.dart';
import 'package:passwords_manager/theme/theme_constants.dart';

class Accountdetails extends StatefulWidget {
  final int accountId;
  const Accountdetails({super.key, required this.accountId});

  @override
  State<Accountdetails> createState() => _AccountdetailsState();
}

class _AccountdetailsState extends State<Accountdetails> {
  List<Map<String, dynamic>> account = [];

  @override
  void initState() {
    super.initState();
    fetchAccount(); // call the method on init
  }

  void fetchAccount() async {
    account = await db.getData(
      "SELECT * FROM accounts WHERE id = ${widget.accountId}",
    );
    setState(() {}); // to rebuild the widget with new data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed:
                        () => Navigator.pushReplacementNamed(context, '/home'),
                    icon: Icon(Icons.arrow_back_ios, color: primaryColor),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child:
                      account.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                account[0]['name'],
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              SizedBox(height: 100),
                              DetailsRow(
                                icon: Icons.calendar_month,
                                text: account[0]['date'],
                                passwordtext: '',
                                password: false,
                              ),
                              SizedBox(height: 40),
                              DetailsRow(
                                icon: Icons.person,
                                text: account[0]['email'],
                                passwordtext: '',
                                password: false,
                              ),
                              SizedBox(height: 40),
                              DetailsRow(
                                icon: Icons.lock,
                                text: '********',
                                passwordtext: account[0]['password'],
                                password: true,
                              ),
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: ColoredButton(
                                      text: 'Delete',
                                      whenPressed: () {
                                        confirmDeletion(
                                          context,
                                          account[0]['id'],
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: BorderedButton(
                                      text: 'Update',
                                      whenPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => Update(
                                                  accountId: account[0]['id'],
                                                ),
                                          ),
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
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsRow extends StatefulWidget {
  final IconData icon;
  final String passwordtext;
  final String text;
  final bool password;
  const DetailsRow({
    super.key,
    required this.icon,
    required this.text,
    required this.password,
    required this.passwordtext,
  });

  @override
  State<DetailsRow> createState() => _DetailsRowState();
}

class _DetailsRowState extends State<DetailsRow> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(widget.icon, color: Color(0xffBABABA)),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.password
                  ? (showPassword ? widget.passwordtext : widget.text)
                  : widget.text,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (widget.password)
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword =
                            !showPassword; // Toggle password visibility
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.copy, color: primaryColor),
                    onPressed: () {
                      copyToClipboard(widget.passwordtext, context);
                    },
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}

void gotToHome(BuildContext context) {
  Navigator.pushReplacementNamed(context, '/home');
}
