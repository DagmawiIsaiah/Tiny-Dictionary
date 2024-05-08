import 'package:dictionary/api/dictionary_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../screens/screens.dart';
import '../app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalizeDictionaryService(); // fetch words from json file.
  await initalizeWords(); // fetch words from dictionary service.
  await initalize(); // initalize app states (dark mode and onboarding state).
  runApp(const Dictionary());
}

class Dictionary extends StatelessWidget {
  const Dictionary({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => WordManager(),
        ),
      ],
      child: Consumer<AppManager>(
        // lsitens for change that app manager controls
        builder: (BuildContext context, AppManager appManager, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false, // hide debug banner
            title: "Tiny Dictionary",
            theme: (darkMode) ? AppTheme.dark() : AppTheme.light(), // applies theme mode on the dark mode state.
            initialRoute: (onboardingCompleted) ? "/" : "/onboardingScreen", // define inital page/Screen based on onboarding state.
            routes: {
              // named routes.
              "/onboardingScreen": (context) => const OnboardingScreen(),
              "/": (context) => const HomeScreen(),
            },
          );
        },
      ),
    );
  }
}
