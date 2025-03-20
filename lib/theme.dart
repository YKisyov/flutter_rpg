import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color.fromRGBO(180, 10, 10, 1.0);
  static Color primaryAccent = const Color.fromRGBO(114, 6, 6, 1.0);
  static Color secondaryColor = const Color.fromRGBO(45, 45, 45, 1);
  static Color secondaryAccent = const Color.fromRGBO(35, 35, 35, 1);
  static Color titleColor = const Color.fromRGBO(200, 200, 200, 1);
  static Color textColor = const Color.fromRGBO(150, 150, 150, 1);
  static Color successColor = const Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = const Color.fromRGBO(246, 246, 106, 1.0);
}

ThemeData myPrimaryTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryAccent),

  //scaffold color
  scaffoldBackgroundColor: AppColors.secondaryAccent,

  //appBar theme
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.textColor,
    // this is the text color of the appBar
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
    shadowColor: Colors.black,
    elevation: 10, //Under question.
  ),

  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.textColor,
      fontSize: 16,
      // letterSpacing: 1,
    ),

    headlineMedium: TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      //letterSpacing: 0.5,
    ),

    titleMedium: TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
      letterSpacing: 1.0,
    ),
  ),

  //Card theme
  cardTheme: CardTheme(
    color: AppColors.secondaryColor.withValues(alpha: 0.82),
    elevation: 7,
    surfaceTintColor: Colors.transparent,
    // shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(16)),
    margin: const EdgeInsets.only(bottom: 10),
  ),

  //Input decoration theme
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.secondaryColor.withValues(alpha: 0.5),
    labelStyle: TextStyle(color: AppColors.textColor),
    prefixIconColor: AppColors.textColor,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.textColor,
        style: BorderStyle.solid,
      )
    )
  ),
);
