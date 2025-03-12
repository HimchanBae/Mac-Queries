// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color BRIGHT_RED = Color(0xFFD6001C);
const Color RED = Color(0xFFA6192E);
const Color DEEP_RED = Color(0xFF76232F);

const Color BRIGHT_PURPLE = Color(0xFFC6007E);
const Color PURPLE = Color(0xFF80225F);
const Color DEEP_PURPLE = Color(0xFF6F1D46);

const Color SAND = Color(0xFFD6D2C4);
const Color LIGHT_SAND = Color(0xFFEDEBE5);
const Color CHARCOAL = Color(0xFF373A36);
const Color SUCCESS = Color(0xFF009174);
const Color ALERT = Color(0xFFBC4700);
const Color INFORMATION = Color(0xFF415364);
const Color DEEP_GRAY = Color(0xFF6F6F6F);
const Color GRAY = Color(0xFFBDBDBD);
const Color LIGHT_GRAY = Color(0xFFD9D9D9);

final theme = ThemeData(
  fontFamily: GoogleFonts.workSans().fontFamily,
  colorScheme: ColorScheme.fromSeed(
    seedColor: DEEP_RED,
    primary: RED,
    secondary: PURPLE,
    brightness: Brightness.light,
    error: ALERT,
    background: LIGHT_SAND,
    surface: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    color: LIGHT_SAND,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black),
    toolbarTextStyle: TextStyle(color: Colors.black),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: RED,
    unselectedItemColor: Colors.black,
  ),
  listTileTheme: const ListTileThemeData(
    contentPadding: EdgeInsets.all(0),
    dense: true,
    horizontalTitleGap: 0.0,
    minLeadingWidth: 0,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'work sans',
      fontSize: 60,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'work sans',
      fontSize: 30,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontFamily: 'work sans',
      fontSize: 48,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontFamily: 'work sans',
      fontSize: 28,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontFamily: 'work sans',
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      fontFamily: 'work sans',
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'work sans',
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      fontFamily: 'work sans',
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: TextStyle(
      fontFamily: 'work sans',
      fontSize: 13,
    ),
  ),
);

final ButtonStyle rectangularButtonRed = ElevatedButton.styleFrom(
  backgroundColor: Colors.white,
  surfaceTintColor: Colors.transparent,
  foregroundColor: Colors.black,
  side: const BorderSide(color: Colors.black, strokeAlign: -1),
  minimumSize: const Size(361, 50),
  padding: const EdgeInsets.all(8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
).copyWith(
  side: MaterialStateProperty.resolveWith<BorderSide?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return const BorderSide(color: RED);
      }
      return const BorderSide(color: Colors.black);
    },
  ),
  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return RED;
      }
      return Colors.white;
    },
  ),
  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.white;
      }
      return Colors.black;
    },
  ),
);

final ButtonStyle circularButtonPurple = ElevatedButton.styleFrom(
  backgroundColor: Colors.white,
  surfaceTintColor: Colors.transparent,
  foregroundColor: Colors.black,
  side: const BorderSide(color: Colors.black, strokeAlign: -1),
  minimumSize: const Size(120, 50),
  padding: const EdgeInsets.all(8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
).copyWith(
  side: MaterialStateProperty.resolveWith<BorderSide?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return const BorderSide(color: PURPLE);
      }
      return const BorderSide(color: Colors.black);
    },
  ),
  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return PURPLE;
      }
      return Colors.white;
    },
  ),
  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.white;
      }
      return Colors.black;
    },
  ),
);
