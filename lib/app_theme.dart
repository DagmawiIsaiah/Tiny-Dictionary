import 'package:flutter/material.dart';

/// define colors used in the app
class AppColors {
  Color white = Colors.white;
  Color whiteAppBar = const Color.fromARGB(255, 245, 245, 245);
  Color whiteSearch = const Color.fromARGB(255, 236, 236, 236);
  Color black = Colors.black;
  Color blackText = const Color.fromARGB(255, 112, 112, 112);
  Color accent = const Color.fromARGB(255, 246, 27, 27);
}

/// define common style for the text style
TextStyle baseTextStyle(Color color) => TextStyle(
      fontFamily: "Roboto",
      color: color,
    );

class AppTheme {
  /// light theme mode text style. based on the baseTextStyle and changes necessary parametes.
  static TextTheme lightTextTheme = TextTheme(
    headlineMedium: baseTextStyle(AppColors().blackText).copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: baseTextStyle(AppColors().blackText).copyWith(
      fontSize: 50,
      fontWeight: FontWeight.w900,
    ),
    titleMedium: baseTextStyle(AppColors().blackText.withOpacity(0.7)).copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: baseTextStyle(AppColors().accent).copyWith(
      color: AppColors().accent,
      fontSize: 16,
    ),
    bodySmall: baseTextStyle(AppColors().blackText).copyWith(
      fontSize: 14,
    ),
  );

  /// dark theme mode text style. based on the baseTextStyle and changes necessary parametes.
  static TextTheme darkTextTheme = TextTheme(
    headlineMedium: baseTextStyle(AppColors().white).copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: baseTextStyle(AppColors().white).copyWith(
      fontSize: 50,
      fontWeight: FontWeight.w900,
    ),
    titleMedium: baseTextStyle(AppColors().white.withOpacity(0.7)).copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: baseTextStyle(AppColors().accent).copyWith(
      color: AppColors().accent,
      fontSize: 16,
    ),
    bodySmall: baseTextStyle(AppColors().white).copyWith(
      fontSize: 14,
    ),
  );

  /// define light theme.
  static ThemeData light() => ThemeData(
        brightness: Brightness.light, // change scaffold bg white and its childs black.
        useMaterial3: true, // states that the app should use material3 style which is just for asthetics.
        textTheme: lightTextTheme, // uses the light text style defined above.
        elevatedButtonTheme: ElevatedButtonThemeData(
          // Define what an eleveted button should look like.
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors().black),
            foregroundColor: MaterialStateProperty.all(AppColors().white),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 16,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      );

  /// define light theme.
  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        textTheme: darkTextTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors().white),
            foregroundColor: MaterialStateProperty.all(AppColors().black),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 16,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      );
}
