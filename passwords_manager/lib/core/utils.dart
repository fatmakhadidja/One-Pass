import 'package:flutter/material.dart';
import 'package:passwords_manager/theme/theme_constants.dart';
import 'package:flutter/services.dart';
import 'package:passwords_manager/screens/accountdetails.dart';
import 'package:passwords_manager/db/password-managerDB.dart';

class CountButton extends StatefulWidget {
  final Color clr;
  final Function(int) onNext;
  final int index;
  const CountButton({
    super.key,
    required this.onNext,
    required this.index,
    required this.clr,
  });

  @override
  State<CountButton> createState() => _CountButtonState();
}

class _CountButtonState extends State<CountButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.onNext(widget.index - 1);
      },
      child: Text(
        '${widget.index}',
        style: TextStyle(
          color: widget.clr,
          fontFamily: 'BabasNeue',
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class PasswordContainer extends StatelessWidget {
  final int number;
  final String text;
  const PasswordContainer({
    super.key,
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                '$number',
                style: TextStyle(
                  color: primaryColor,
                  fontFamily: 'BabasNeue',
                  fontSize: 64,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  text,
                  style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontFamily: 'BabasNeue',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
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

class HomeSearchBar extends StatefulWidget {
  final Color borderColor;
  final FocusNode focusNode;
  final TextEditingController searchController;
  const HomeSearchBar({
    super.key,
    required this.focusNode,
    required this.borderColor,
    required this.searchController,
  });

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: widget.searchController,
      focusNode: widget.focusNode,
      side: WidgetStateProperty.all(
        BorderSide(color: widget.borderColor, width: 1),
      ),
      backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(Icons.search, color: Color(0xffBABABA)),
      ),
      hintText: 'Search accounts ..',
      hintStyle: WidgetStateProperty.all(
        Theme.of(context).textTheme.headlineSmall,
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      elevation: WidgetStateProperty.all(0),
    );
  }
}

class AccountContainer extends StatelessWidget {
  final int accountId;

  final IconData icon;
  final String account;

  const AccountContainer({
    super.key,
    required this.icon,
    required this.account,
    required this.accountId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Accountdetails(accountId: accountId),
          ), // example ID
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.101,

        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffF1F1F1), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(icon, color: Theme.of(context).hintColor),
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(account, style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
              IconButton(
                onPressed: () async {
                  List<Map<String, dynamic>> accounts = await db.getData(
                    "SELECT * FROM accounts WHERE id = $accountId",
                  );
                  Map<String, dynamic> accountData = accounts.first;
                  String password = accountData['password'];
                  copyToClipboard(password, context);
                },
                icon: Icon(Icons.copy, color: primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColoredButton extends StatelessWidget {
  final String text;
  final Function() whenPressed;
  const ColoredButton({
    super.key,
    required this.text,
    required this.whenPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        side: WidgetStatePropertyAll(BorderSide(color: primaryColor, width: 2)),
        backgroundColor: WidgetStatePropertyAll(primaryColor),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        ),
      ),
      onPressed: whenPressed,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'BabasNeue',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class BorderedButton extends StatelessWidget {
  final String text;
  final Function() whenPressed;
  const BorderedButton({
    super.key,
    required this.text,
    required this.whenPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        side: WidgetStatePropertyAll(BorderSide(color: primaryColor, width: 2)),
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: WidgetStatePropertyAll(primaryColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        ),
      ),
      onPressed: whenPressed,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'BabasNeue',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

void copyToClipboard(String text, BuildContext context) {
  Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 5,
      content: Text("Copied to clipboard!"),
      duration: Duration(seconds: 1),
    ),
  );
}

void confirmDeletion(BuildContext context, int accountId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Confirm Deletion",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontFamily: 'BabasNeue',
            fontWeight: FontWeight.w500,
          ),
        ),
        content: Text(
          "Are you sure you want to delete this account?",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              "Cancel",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          TextButton(
            onPressed: () {
              db.deleteData("DELETE FROM accounts WHERE id = $accountId");
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: Text(
              "Delete",
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontFamily: 'BabasNeue',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
    },
  );
}

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
  });

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !_isPasswordVisible,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return primaryColor;
          }
          return Theme.of(context).secondaryHeaderColor;
        }),
        floatingLabelBehavior: FloatingLabelBehavior.always,

        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.titleMedium,
        labelText: widget.label,
        labelStyle: Theme.of(context).textTheme.titleMedium,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Theme.of(context).secondaryHeaderColor,
            width: 1.25,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: primaryColor, width: 1.25),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          iconSize: 20,
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
    );
  }
}

class AddRows extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String description;
  const AddRows({
    super.key,
    required this.title,
    required this.description,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        TextField(
          controller: controller,
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

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.titleMedium,
        labelText: label,
        labelStyle: Theme.of(context).textTheme.titleMedium,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Theme.of(context).secondaryHeaderColor,
            width: 1.25,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color:
                primaryColor, // Make sure primaryColor is defined in your theme or globally
            width: 1.25,
          ),
        ),
      ),
    );
  }
}
