import 'package:flutter/material.dart';
import 'package:passwords_manager/theme/theme_constants.dart';
import '../core/utils.dart';
import 'package:passwords_manager/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedindex = 0;
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> filteredAccounts = [];

  List<Map<String, dynamic>> accounts = [
    {'icon': Icons.facebook, 'account': 'Facebook'},
    {'icon': Icons.facebook, 'account': 'Instagram'},
    {'icon': Icons.facebook, 'account': 'Twitter'},
    {'icon': Icons.facebook, 'account': 'Facebook'},
    {'icon': Icons.facebook, 'account': 'Facebook'},
    {'icon': Icons.facebook, 'account': 'Facebook'},
  ];
  FocusNode _focusNode = FocusNode();
  Color borderColor = Color(0xffF1F1F1);

  @override
  void initState() {
    super.initState();
    filteredAccounts = List.from(accounts);

    _searchController.addListener(() {
      setState(() {
        filteredAccounts =
            accounts
                .where(
                  (account) => account['account'].toLowerCase().startsWith(
                    _searchController.text.toLowerCase(),
                  ),
                )
                .toList();
      });
    });

    // Listen for focus changes
    _focusNode.addListener(() {
      setState(() {
        borderColor = _focusNode.hasFocus ? primaryColor : Color(0xffF1F1F1);
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),

                  Switch(
                    value: themeManager.themeMode == ThemeMode.dark,
                    onChanged: (bool isDark) async {
                      await themeManager.toggleTheme(isDark);
                      setState(() {});
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PasswordContainer(number: 5, text: 'Stored \n passwords'),
                  PasswordContainer(number: 0, text: 'Generated\n passwords'),
                ],
              ),
              SizedBox(height: 20),
              HomeSearchBar(
                focusNode: _focusNode,
                borderColor: borderColor,
                searchController: _searchController,
              ),
              SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children:
                        filteredAccounts.isEmpty
                            ? [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "No accounts found",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ]
                            : filteredAccounts.map((account) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: AccountContainer(
                                  icon: account['icon']!,
                                  account: account['account']!,
                                ),
                              );
                            }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        elevation: 5,
        color: Theme.of(context).primaryColor, // Light grey background

        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedindex = 0;
                  });
                },
                icon: Icon(
                  Icons.home,
                  color:
                      _selectedindex == 0
                          ? primaryColor
                          : Theme.of(context).secondaryHeaderColor,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedindex = 1;
                  });
                },
                icon: Icon(
                  Icons.person,
                  color:
                      _selectedindex == 1
                          ? primaryColor
                          : Theme.of(context).secondaryHeaderColor,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.redAccent, // Red color
        child: Icon(Icons.add, size: 30, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
