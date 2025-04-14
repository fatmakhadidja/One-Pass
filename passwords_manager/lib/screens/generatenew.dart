import 'package:flutter/material.dart';
import 'package:passwords_manager/core/utils.dart';
import 'package:passwords_manager/theme/theme_constants.dart';
import 'dart:math';

class Generatenew extends StatefulWidget {
  const Generatenew({super.key});

  @override
  State<Generatenew> createState() => _GeneratenewState();
}

class _GeneratenewState extends State<Generatenew> {
  TextEditingController passwordCtrl = TextEditingController(
    text: generateRandomString(8, false),
  );
  int selectedLength = 8;
  String includeSymbols = 'No';
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
                        'Generate new',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(height: 100),
                      GenerateNewTextField(
                        controller: passwordCtrl,
                        generatedPassword: passwordCtrl.text,
                      ),
                      SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Password Length
                          Text(
                            'PASSWORD LENGTH',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 8),
                          DropdownButtonFormField<int>(
                            value: selectedLength,
                            items:
                                List.generate(20, (index) => index + 1)
                                    .map(
                                      (length) => DropdownMenuItem(
                                        value: length,
                                        child: Text(
                                          length.toString(),
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.titleMedium,
                                        ),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedLength = value!;
                              });
                            },
                            decoration: InputDecoration(),
                          ),
                          SizedBox(height: 30),

                          // Include Symbols
                          Text(
                            'INCLUDE SYMBOLS',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            value: includeSymbols,
                            items:
                                ['Yes', 'No']
                                    .map(
                                      (option) => DropdownMenuItem(
                                        value: option,
                                        child: Text(
                                          option,
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.titleMedium,
                                        ),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {
                              setState(() {
                                includeSymbols = value!;
                              });
                            },
                            decoration: InputDecoration(),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: BorderedButton(
                              text: 'Randomize',
                              whenPressed: () {
                                setState(() {
                                  passwordCtrl.text = generateRandomString(
                                    selectedLength,
                                    includeSymbols == 'Yes' ? true : false,
                                  );
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ColoredButton(
                              text: 'Copy',
                              whenPressed: () {
                                copyToClipboard(passwordCtrl.text, context);
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
    );
  }
}

// ignore: must_be_immutable
class GenerateNewTextField extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  String generatedPassword;
  GenerateNewTextField({
    super.key,
    required this.generatedPassword,
    required this.controller,
  });

  @override
  State<GenerateNewTextField> createState() => _GenerateNewTextFieldState();
}

class _GenerateNewTextFieldState extends State<GenerateNewTextField> {
  late TextEditingController mycontroller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: TextStyle(
        color: Theme.of(context).secondaryHeaderColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: 'BabasNeue',
      ),

      textAlign: TextAlign.center, // Centers only the input text
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,

        // Always show label
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
    );
  }
}

String generateRandomString(int length, bool includeSymbols) {
  const String letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String numbers = '0123456789';
  const String symbols = '!@#\$%^&*()-_=+[]{};:,.<>?/|';

  final String chars = letters + numbers + (includeSymbols ? symbols : '');
  final Random random = Random.secure();

  return List.generate(
    length,
    (index) => chars[random.nextInt(chars.length)],
  ).join();
}
