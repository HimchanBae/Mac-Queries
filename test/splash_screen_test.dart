import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mac_queries/screen/splash_screen.dart';
import 'package:mac_queries/screen/start_screen.dart';

void main() {
  group('SplashScreen Tests', () {
    testWidgets('SplashScreen displays main image and version text',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SplashScreen()));

      expect(find.byType(Image), findsOneWidget);

      expect(find.text('V 1.0.0'), findsOneWidget);
    });

    testWidgets('SplashScreen navigates to StartScreen after delay',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: const SplashScreen(),
        routes: {
          '/start': (context) => const StartScreen(),
        },
      ));

      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byType(StartScreen), findsOneWidget);
    });
  });
}
