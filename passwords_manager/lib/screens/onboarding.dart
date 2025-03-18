import 'package:flutter/material.dart';
import 'package:passwords_manager/core/constants.dart';
import 'package:passwords_manager/theme/theme_constants.dart';

int index = 0;

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  scrollToPage(int ind) {
    setState(() {
      index = ind;
    });
  }

  late List<Widget> onboardingScreens;
  @override
  void initState() {
    super.initState();
    onboardingScreens = [
      FirstScreen(onNext: scrollToPage),
      SecondScreen(onNext: scrollToPage),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: onboardingScreens[index],
    );
  }
}

class FirstScreen extends StatefulWidget {
  final Function(int) onNext; // Callback function to change page
  const FirstScreen({super.key, required this.onNext});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Image.asset('assets/images/logo.png')],
            ),
          ),

          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: RichText(
                  text: TextSpan(
                    text: 'GENERATE ',
                    style: Theme.of(context).textTheme.headlineLarge,
                    children: [
                      TextSpan(
                        text: 'SECURE ',
                        style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'BabasNeue',
                          fontSize: 64,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: 'PASSWORDS',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  'Stop using unsecure passwords for your online accounts, '
                  'level up with OnePass. Get the most secure and difficult-to-crack passwords.',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CountButton(onNext: widget.onNext, index: 1, clr: primaryColor),
              CountButton(
                onNext: widget.onNext,
                index: 2,
                clr: Color(0xffBABABA),
              ),
              CountButton(
                onNext: widget.onNext,
                index: 3,
                clr: Color(0xffBABABA),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  final Function(int) onNext; // Callback function to change page
  const SecondScreen({super.key, required this.onNext});
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Image.asset('assets/images/logo.png')],
            ),
          ),

          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: RichText(
                  text: TextSpan(
                    text: 'ALL YOUR ',
                    style: Theme.of(context).textTheme.headlineLarge,
                    children: [
                      TextSpan(
                        text: 'PASSWORDS ',
                        style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'BabasNeue',
                          fontSize: 64,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: 'ARE HERE',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  'Store and manage all of your passwords from one place. '
                  'Don’t remember hundreds of passwords, just remember one.',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CountButton(
                onNext: widget.onNext,
                index: 1,
                clr: Color(0xffBABABA),
              ),
              CountButton(onNext: widget.onNext, index: 2, clr: primaryColor),
              CountButton(
                onNext: widget.onNext,
                index: 3,
                clr: Color(0xffBABABA),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
