import 'package:flutter/material.dart';
import 'package:passwords_manager/core/utils.dart';
import 'package:passwords_manager/theme/theme_constants.dart';

class Generatenew extends StatefulWidget {
  const Generatenew({super.key});

  @override
  State<Generatenew> createState() => _GeneratenewState();
}

class _GeneratenewState extends State<Generatenew> {
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
                      GenerateNewTextField(),
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
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                          ),
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
                            child: ColoredButton(
                              text: 'add new',
                              whenPressed: () {},
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: BorderedButton(
                              text: 'Generate new',
                              whenPressed: () {},
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

class GenerateNewTextField extends StatefulWidget {
  const GenerateNewTextField({super.key});

  @override
  State<GenerateNewTextField> createState() => _GenerateNewTextFieldState();
}

class _GenerateNewTextFieldState extends State<GenerateNewTextField> {
  TextEditingController mycontroller = TextEditingController(
    text: 'kshdysncge',
  );
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: mycontroller,
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
      ),
    );
  }
}
