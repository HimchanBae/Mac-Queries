import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mac_queries/screen/start_screen.dart';
import 'package:mac_queries/component/login_modal.dart';

void main() {
  group('StartScreen Tests', () {
    testWidgets('StartScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: StartScreen()));

      expect(find.byType(Image), findsOneWidget);

      expect(find.text('Ask Queries.'), findsOneWidget);
      expect(find.text('Discover. Connect.'), findsOneWidget);
      expect(find.text("Let's Get Started!"), findsOneWidget);

      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('Shows login modal when the start button is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: StartScreen()));

      expect(find.byType(LoginModal), findsNothing);

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.byType(LoginModal), findsOneWidget);
    });
  });
}
