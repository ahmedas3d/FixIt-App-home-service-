import 'package:fixit_app/core/utils/service/shared_preferenes/onboarding_service.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../auth/presentation/screens/SignIn_screen.dart';
import '../widgets/onboarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late List<Map<String, String>> onboardingData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    onboardingData = [
      {
        "image": "assets/images/onboarding1.png",
        "title": S.of(context).welcomeToFixit,
        "description": S.of(context).descriptionOn1,
      },
      {
        "image": "assets/images/onboarding2.png",
        "title": S.of(context).titleOn2,
        "description": S.of(context).descriptionOn2,
      },
      {
        "image": "assets/images/onboarding3.png",
        "title": S.of(context).titleOn3,
        "description": S.of(context).descriptionOn3,
      },
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue[900]!, Color(0xff00152A)],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    image: onboardingData[index]["image"]!,
                    title: onboardingData[index]["title"]!,
                    description: onboardingData[index]["description"]!,
                  );
                },
              ),
              Positioned(
                top: 20,
                right: 20,
                left: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: onboardingData.length,
                        effect: ExpandingDotsEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: Colors.white,
                          dotColor: Colors.grey,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    SignInScreen(),
                            transitionsBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                              child,
                            ) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                          (route) => false,
                        );
                      },
                      child: Text(
                        S.of(context).skip,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 30,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () async {
                    await OnboardingService.completeOnboarding();
                    if (_currentPage < onboardingData.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      // Navigate to the next screen
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  SignInScreen(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                        (route) => false,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: MediaQuery.of(context).size.width * 0.2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    _currentPage == onboardingData.length - 1
                        ? S.of(context).getStarted
                        : S.of(context).next,
                    style: TextStyle(fontSize: 18, color: Colors.white),
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
