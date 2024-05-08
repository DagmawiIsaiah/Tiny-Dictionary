import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../app_theme.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';
import '../screens/screens.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = "/onboardingScreen";
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
        ),
        child: Stack(
          children: [
            ImageSlideshow(
              width: double.infinity,
              height: double.infinity,
              initialPage: 0,
              indicatorColor: (darkMode)
                  ? AppColors().white
                  : AppColors().black,
              indicatorBackgroundColor: Colors.grey,
              indicatorBottomPadding: size.height * 0.1,
              indicatorPadding: 10,
              indicatorRadius: 5,
              onPageChanged: (value) => setState(() {
                pageNumber = value;
              }),
              children: const [
                OnboardingPage(
                    title: "Minimal design",
                    subtitle:
                        "Clutter free minimal design allows you to get just what you want",
                    illustrationUrl: "assets/images/onboarding_1.png"),
                OnboardingPage(
                    title: "Tiny",
                    subtitle:
                        "The word list is so short and contains only some of the most common English words",
                    illustrationUrl: "assets/images/onboarding_2.png"),
                OnboardingPage(
                    title: "Fast",
                    subtitle:
                        "With fast response and overall performance you won't feel and lag",
                    illustrationUrl: "assets/images/onboarding_3.png"),
              ],
            ),
            Positioned(
              top: 20,
              right: 20,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                  AppManager().updateOnboardingStatus(true);
                },
                child: const Text("Skip"),
              ),
            ),
            (pageNumber == 2)
                ? Positioned(
                    bottom: size.height * 0.01,
                    child: SizedBox(
                      width: size.width,
                      child: Row(
                        children: [
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, HomeScreen.routeName);
                              AppManager().updateOnboardingStatus(true);
                            },
                            child: const Text("Start search"),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
