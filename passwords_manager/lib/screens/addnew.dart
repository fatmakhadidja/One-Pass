import 'package:flutter/material.dart';
import 'package:passwords_manager/core/utils.dart';
import 'package:passwords_manager/theme/theme_constants.dart';

class Addnew extends StatefulWidget {
  const Addnew({super.key});

  @override
  State<Addnew> createState() => _AddnewState();
}

class _AddnewState extends State<Addnew> {
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
                            icon: Icon(
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
                      SizedBox(height: 100),
                      AddRows(title: 'NAME', description: 'Enter account name'),
                      SizedBox(height: 40),
                      AddRows(
                        title: 'EMAIL/USERNAME',
                        description: 'Enter email/username',
                      ),
                      SizedBox(height: 40),
                      AddRows(title: 'PASSWORD', description: 'Enter password'),
                      SizedBox(height: 40),

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
        padding: const EdgeInsets.only(bottom: 20,left: 30,right: 30),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ColoredButton(
            text: 'Add new',
            whenPressed: () {
              Navigator.pushNamed(context, '/addnew');
            },
          ),
        ),
      ),
    );
  }
}

class AddRows extends StatelessWidget {
  final String title;
  final String description;
  const AddRows({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        TextField(
          decoration: InputDecoration(
            labelText: description,
            labelStyle: TextStyle(
              color: Color(0xffBABABA),
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'BabasNeue',
            ),
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
