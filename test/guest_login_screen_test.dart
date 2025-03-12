import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mac_queries/screen/guest_login_screen.dart';
import 'package:mac_queries/screen/loading_screen.dart';

void main() {
  group('GuestLoginScreen Tests', () {
    testWidgets('GuestLoginScreen UI tests', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: GuestLoginScreen()));

      expect(find.text('Welcome!'), findsOneWidget);
      expect(
          find.text(
              'To address your enquiries,\nplease input your name and Email.'),
          findsOneWidget);
      expect(find.byType(ElevatedButton), findsWidgets);

      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pumpAndSettle();
      expect(find.byType(LoadingScreen), findsNothing);
    });
  });

  group('GuestLoginScreen Input Validation Tests', () {
    testWidgets('Validates Name and Email fields correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: GuestLoginScreen()));

      // Name Field Validation
      var nameField = find.byType(TextFormField).at(0);
      await tester.enterText(nameField, 'John Doe');
      await tester.pump();
      expect(find.text('Please enter a valid Name'), findsNothing);

      await tester.enterText(nameField, 'John123');
      await tester.pump();
      expect(find.text('Please enter a valid Name'), findsOneWidget);

      // Email Field Validation
      var emailField = find.byType(TextFormField).at(1);
      await tester.enterText(emailField, 'test@example.com');
      await tester.pump();
      expect(find.text('Please enter a valid Email address'), findsNothing);

      await tester.enterText(emailField, 'test@');
      await tester.pump();
      expect(find.text('Please enter a valid Email address'), findsOneWidget);
    });
  });
}
