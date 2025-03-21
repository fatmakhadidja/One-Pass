import 'package:flutter/material.dart';
import 'package:passwords_manager/theme/theme_constants.dart';

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
        color: Color(0xffF1F1F1),
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
                  '$text',
                  style: Theme.of(context).textTheme.titleMedium
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
  final IconData icon;
  final String account;

  const AccountContainer({
    super.key,
    required this.icon,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/accountdetails');
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
                  Text(
                    '$account',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.copy, color: primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
