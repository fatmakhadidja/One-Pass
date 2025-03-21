import 'package:flutter/material.dart';
import 'package:passwords_manager/core/utils.dart';
import 'package:passwords_manager/theme/theme_constants.dart';
import 'package:flutter/services.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
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
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'UPDATE',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(height: 100),
                      UpdateRows(title: 'NAME', description: 'Facebook'),
                      SizedBox(height: 40),
                      UpdateRows(
                        title: 'EMAIL/USERNAME',
                        description: 'Facebook',
                      ),
                      SizedBox(height: 40),
                      UpdateRows(title: 'PASSWORD', description: 'Facebook'),
                      SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: BorderedButton(
                              text: 'Generate password',
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

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ColoredButton(text: 'Save changes', whenPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateRows extends StatelessWidget {
  final String title;
  final String description;
  const UpdateRows({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        TextField(
          decoration: InputDecoration(
            labelText: description,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(context).indicatorColor,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(context).indicatorColor,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: primaryColor, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
