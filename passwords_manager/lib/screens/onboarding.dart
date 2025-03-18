import 'package:flutter/material.dart';
import 'package:passwords_manager/theme/theme_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homescreen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int index = 0;

  void scrollToPage(int ind) {
    _pageController.animateToPage(
      ind,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: PageView(
        controller: _pageController,
        onPageChanged: (i) {
          setState(() {
            index = i;
          });
        },
        children: [
          FirstScreen(onNext: scrollToPage),
          SecondScreen(onNext: scrollToPage),
          ThirdScreen(onNext: scrollToPage),
        ],
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  final Function(int) onNext;
  const FirstScreen({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return OnboardingPage(
      logo: 'assets/images/logo.png',
      title: 'GENERATE ',
      highlighted: 'SECURE ',
      subtitle: 'PASSWORDS',
      description:
          'Stop using unsecure passwords for your online accounts, level up with OnePass.',
      onNext: onNext,
      currentIndex: 0,
    );
  }
}

class SecondScreen extends StatelessWidget {
  final Function(int) onNext;
  const SecondScreen({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return OnboardingPage(
      logo: 'assets/images/logo.png',
      title: 'ALL YOUR ',
      highlighted: 'PASSWORDS ',
      subtitle: 'ARE HERE',
      description:
          'Store and manage all of your passwords from one place. Don’t remember hundreds of passwords, just remember one.',
      onNext: onNext,
      currentIndex: 1,
    );
  }
}

class ThirdScreen extends StatelessWidget {
  final Function(int) onNext;

  ThirdScreen({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return OnboardingPage(
      logo: 'assets/images/logo.png',
      title: 'DON’T TYPE, ',
      highlighted: 'AUTOFILL ',
      subtitle: 'YOUR CREDENTIALS',
      description:
          'Let OnePass autofill your credentials and keep your passwords secure.',
      onNext: onNext,

      currentIndex: 2,
      isLast: true,
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String logo;
  final String title;
  final String highlighted;
  final String subtitle;
  final String description;
  final Function(int) onNext;
  final int currentIndex;
  final bool isLast;

  OnboardingPage({
    super.key,
    required this.logo,
    required this.title,
    required this.highlighted,
    required this.subtitle,
    required this.description,
    required this.onNext,
    required this.currentIndex,
    this.isLast = false,
  });

  void completeOnboarding(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Image.asset(logo)],
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: RichText(
                  text: TextSpan(
                    text: title,
                    style: Theme.of(context).textTheme.headlineLarge,
                    children: [
                      TextSpan(
                        text: highlighted,
                        style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'BabasNeue',
                          fontSize: 64,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: subtitle,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(
                  3,
                  (i) => CountButton(
                    onNext: onNext,
                    index: i,
                    clr:
                        i == currentIndex
                            ? primaryColor
                            : const Color(0xffBABABA),
                  ),
                ),
              ),
              isLast
                  ? ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(primaryColor),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80),
                        ),
                      ),
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}

class CountButton extends StatelessWidget {
  final Function(int) onNext;
  final int index;
  final Color clr;

  const CountButton({
    super.key,
    required this.onNext,
    required this.index,
    required this.clr,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onNext(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 10,
        height: 10,
        decoration: BoxDecoration(color: clr, shape: BoxShape.circle),
      ),
    );
  }
}
