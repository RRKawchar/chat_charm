import 'package:chat_app_demo/src/core/utils/colors.dart';
import 'package:flutter/material.dart';

var lightTheme=ThemeData();
var darkTheme=ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackgroundColor,
    appBarTheme: const AppBarTheme(
      color: kContainerColor
    ),
    inputDecorationTheme:  InputDecorationTheme(
      fillColor: kBackgroundColor,
      filled: true,
      border: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      )
    ),
    colorScheme: const ColorScheme.dark(
      primary: kPrimaryColor,
      onPrimary:  kOnBackgroundColor,
      background: kBackgroundColor,
      onBackground: kOnBackgroundColor,
      primaryContainer: kContainerColor,
      onPrimaryContainer: kOnContainerColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32,
          color: kPrimaryColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w800
      ),
      headlineMedium: TextStyle(
          fontSize: 30,
          color: kOnBackgroundColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600
      ),
      headlineSmall: TextStyle(
          fontSize: 20,
          color: kOnBackgroundColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600
      ),
      bodyLarge: TextStyle(
          fontSize: 18,
          color: kOnBackgroundColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500
      ),
      bodyMedium: TextStyle(
          fontSize: 15,
          color: kOnBackgroundColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400
      ),
      labelLarge: TextStyle(
          fontSize: 15,
          color: kOnContainerColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400
      ),
      labelMedium: TextStyle(
          fontSize: 12,
          color: kOnContainerColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400
      ),
      labelSmall: TextStyle(
          fontSize: 10,
          color: kOnContainerColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w300
      ),
    )
);