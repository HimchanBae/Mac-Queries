import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mac_queries/screen/one_login_screen.dart';
import 'package:mac_queries/screen/loading_screen.dart';

void main() {
  group('OneLoginScreen Tests', () {
    testWidgets('OneLoginScreen UI tests', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: OneLoginScreen()));

      expect(find.text('Welcome Back!'), findsOneWidget);
      expect(find.text('Please login to continue.'), findsOneWidget);
      expect(find.text('One ID*?'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsWidgets);

      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pumpAndSettle();

      expect(find.byType(LoadingScreen), findsNothing);
    });
  });

  group('OneLoginScreen Input Validation Tests', () {
    testWidgets('Validates ID and Password fields correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: OneLoginScreen()));

      // ID Field Validation
      var idField = find.byType(TextFormField).at(0);
      await tester.enterText(idField, '12345678');
      await tester.pump();
      expect(find.text('Please enter a valid One ID'), findsNothing);

      await tester.enterText(idField, '123456');
      await tester.pump();
      expect(find.text('Please enter a valid One ID'), findsOneWidget);

      // Password Field Validation
      var passwordField = find.byType(TextFormField).at(1);
      await tester.enterText(passwordField, 'Pass@1234');
      await tester.pump();
      expect(find.text('Please enter a valid Password'), findsNothing);

      await tester.enterText(passwordField, 'pass');
      await tester.pump();
      expect(find.text('Please enter a valid Password'), findsOneWidget);
    });
  });
}
