import 'package:flutter/material.dart';
import 'package:passwords_manager/theme/theme_constants.dart';
import 'package:flutter/services.dart';

class Accountdetails extends StatefulWidget {
  const Accountdetails({super.key});

  @override
  State<Accountdetails> createState() => _AccountdetailsState();
}

class _AccountdetailsState extends State<Accountdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 15),
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
                    icon: Icon(Icons.arrow_back_ios, color: primaryColor),
                  ),
                ],
              ),

              Text(
                'Facebook',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 100),
              DetailsRow(
                icon: Icons.calendar_month,
                text: '20/03/2025',
                passwordtext: '',
                password: false,
              ),
              SizedBox(height: 40),
              DetailsRow(
                icon: Icons.person,
                text: 'Djerfi@gmail.com',
                passwordtext: '',
                password: false,
              ),
              SizedBox(height: 40),
              DetailsRow(
                icon: Icons.lock,
                text: '********',
                passwordtext: 'fuck off',
                password: true,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
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
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          fontFamily: 'BabasNeue',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        side: WidgetStatePropertyAll(
                          BorderSide(color: primaryColor, width: 2),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                        foregroundColor: WidgetStatePropertyAll(primaryColor),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/update');
                      },

                      child: Text(
                        'Update',
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
  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 5,
        content: Text("Copied to clipboard!"),
        duration: Duration(seconds: 1),
      ),
    );
  }

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
                      copyToClipboard(widget.passwordtext);
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
