import 'package:flutter/material.dart';
import 'package:passwords_manager/db/password-managerDB.dart';
import 'package:passwords_manager/theme/theme_constants.dart';
import '../core/utils.dart';

import 'package:passwords_manager/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void fetchAccounts() async {
    accounts = await db.getData("SELECT * FROM accounts");
    setState(() {
      filteredAccounts = List.from(accounts);
    });
  }

  int _selectedindex = 0;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Color borderColor = const Color(0xffF1F1F1);
  Future<int> passwordsNumber = db.getAccountsCount();
  Future<int> generatedNumber = db.getGeneratedCount();

  List<Map<String, dynamic>> accounts = [];

  List<Map<String, dynamic>> filteredAccounts = [];

  @override
  void initState() {
    super.initState();
    fetchAccounts();
    passwordsNumber = db.getAccountsCount();
    generatedNumber = db.getGeneratedCount();
    _searchController.addListener(() {
      final query = _searchController.text.toLowerCase();
      setState(() {
        filteredAccounts =
            accounts
                .where(
                  (account) => account['name']
                      .toString()
                      .toLowerCase()
                      .startsWith(query),
                )
                .toList();
      });
    });

    _focusNode.addListener(() {
      setState(() {
        borderColor =
            _focusNode.hasFocus ? primaryColor : const Color(0xffF1F1F1);
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  IconButton _buildBottomNavIcon(IconData icon, int index) {
    return IconButton(
      onPressed: () => setState(() => _selectedindex = index),
      icon: Icon(
        icon,
        color:
            _selectedindex == index
                ? primaryColor
                : Theme.of(context).secondaryHeaderColor,
        size: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body:
          _selectedindex == 0
              ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/logo.png'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FutureBuilder<int>(
                            future: passwordsNumber,
                            builder: (context, snapshot) {
                              return PasswordContainer(
                                number: snapshot.data ?? 0,
                                text: 'Stored \n passwords',
                              );
                            },
                          ),

                          FutureBuilder<int>(
                            future: generatedNumber,
                            builder: (context, snapshot) {
                              return PasswordContainer(
                                number: snapshot.data ?? 0,
                                text: 'Generated\n passwords',
                              );
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      HomeSearchBar(
                        focusNode: _focusNode,
                        borderColor: borderColor,
                        searchController: _searchController,
                      ),
                      const SizedBox(height: 15),
                      Expanded(
                        child:
                            filteredAccounts.isEmpty
                                ? const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Text(
                                      "No accounts found",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                )
                                : ListView.builder(
                                  itemCount: filteredAccounts.length,
                                  itemBuilder: (context, index) {
                                    final account = filteredAccounts[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: AccountContainer(
                                        icon: Icons.lock,
                                        account: account['name'],
                                        accountId: account['id'],
                                      ),
                                    );
                                  },
                                ),
                      ),
                    ],
                  ),
                ),
              )
              : const Profile(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          elevation: 5,
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBottomNavIcon(Icons.home, 0),
                _buildBottomNavIcon(Icons.person, 1),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/addnew');
          },
          backgroundColor: Colors.redAccent,
          child: const Icon(Icons.add, size: 30, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
