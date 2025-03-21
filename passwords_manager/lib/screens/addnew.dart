import 'package:flutter/material.dart';
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
                        'ADD NEW',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(height: 100),
                      AddRows(title: 'NAME', description: 'Facebook'),
                      SizedBox(height: 40),
                      AddRows(title: 'EMAIL/USERNAME', description: 'Facebook'),
                      SizedBox(height: 40),
                      AddRows(title: 'PASSWORD', description: 'Facebook'),
                      SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: OutlinedButton(
                              style: ButtonStyle(
                                side: WidgetStatePropertyAll(
                                  BorderSide(color: primaryColor, width: 2),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.transparent,
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  primaryColor,
                                ),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Generate Password',
                                style: TextStyle(
                                  fontFamily: 'BabasNeue',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
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
                child: ElevatedButton(
                  style: ButtonStyle(
                    side: WidgetStatePropertyAll(
                      BorderSide(color: primaryColor, width: 2),
                    ),
                    backgroundColor: WidgetStatePropertyAll(primaryColor),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Add new',
                    style: TextStyle(
                      fontFamily: 'BabasNeue',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
