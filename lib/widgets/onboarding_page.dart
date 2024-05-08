import 'package:dictionary/app_theme.dart';
import 'package:dictionary/models/app_manager.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String illustrationUrl;

  const OnboardingPage(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.illustrationUrl});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Container(
              height: size.height * 0.45,
              width: double.maxFinite,
              constraints: const BoxConstraints(
                maxHeight: 200,
                maxWidth: 200,
              ),
              child: Image.asset(
                illustrationUrl,
                color: (darkMode)
                    ? AppColors().white
                    : AppColors().black,
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: size.height / 5,
            )
          ],
        ),
      ),
    );
  }
}
