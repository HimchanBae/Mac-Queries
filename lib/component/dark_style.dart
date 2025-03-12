// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color DARK_BRIGHT_RED = Color(0xFF8B0000);
const Color DARK_RED = Color(0xFF560000);
const Color DARK_DEEP_RED = Color(0xFF3C0000);

const Color DARK_BRIGHT_PURPLE = Color(0xFF8B008B);
const Color DARK_PURPLE = Color(0xFF4B0082);
const Color DARK_DEEP_PURPLE = Color(0xFF2E0854);

const Color DARK_SAND = Color(0xFF2E2E2E);
const Color DARK_LIGHT_SAND = Color(0xFF1C1C1C);
const Color DARK_CHARCOAL = Color(0xFF121212);
const Color DARK_SUCCESS = Color(0xFF004D40);
const Color DARK_ALERT = Color(0xFF8B4513);
const Color DARK_INFORMATION = Color(0xFF263238);
const Color DARK_DEEP_GRAY = Color(0xFF424242);
const Color DARK_GRAY = Color(0xFF616161);
const Color DARK_LIGHT_GRAY = Color(0xFF757575);

final darkTheme = ThemeData(
  fontFamily: GoogleFonts.workSans().fontFamily,
  colorScheme: ColorScheme.fromSeed(
    seedColor: DARK_RED,
    primary: DARK_RED,
    secondary: DARK_PURPLE,
    brightness: Brightness.dark,
    error: DARK_ALERT,
    background: DARK_LIGHT_SAND,
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
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'work sans',
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontFamily: 'work sans',
      fontSize: 48,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontFamily: 'work sans',
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    labelLarge: TextStyle(
      fontFamily: 'work sans',
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontFamily: 'work sans',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'work sans',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontFamily: 'work sans',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontFamily: 'work sans',
      fontSize: 13,
      color: Colors.white,
    ),
  ),
);

final ButtonStyle darkRectangularButtonRed = ElevatedButton.styleFrom(
  backgroundColor: DARK_CHARCOAL,
  surfaceTintColor: Colors.transparent,
  foregroundColor: Colors.white,
  side: const BorderSide(color: Colors.white, strokeAlign: -1),
  minimumSize: const Size(361, 50),
  padding: const EdgeInsets.all(8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
).copyWith(
  side: MaterialStateProperty.resolveWith<BorderSide?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return const BorderSide(color: DARK_RED);
      }
      return const BorderSide(color: Colors.white);
    },
  ),
  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return DARK_RED;
      }
      return DARK_CHARCOAL;
    },
  ),
  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.white;
      }
      return Colors.white;
    },
  ),
);

final ButtonStyle darkCircularButtonPurple = ElevatedButton.styleFrom(
  backgroundColor: DARK_CHARCOAL,
  surfaceTintColor: Colors.transparent,
  foregroundColor: Colors.white,
  side: const BorderSide(color: Colors.white, strokeAlign: -1),
  minimumSize: const Size(120, 50),
  padding: const EdgeInsets.all(8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
).copyWith(
  side: MaterialStateProperty.resolveWith<BorderSide?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return const BorderSide(color: DARK_PURPLE);
      }
      return const BorderSide(color: Colors.white);
    },
  ),
  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return DARK_PURPLE;
      }
      return DARK_CHARCOAL;
    },
  ),
  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.white;
      }
      return Colors.white;
    },
  ),
);
