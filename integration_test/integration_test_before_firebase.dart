import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mac_queries/screen/guest_login_screen.dart';
import 'package:mac_queries/screen/one_login_screen.dart';
import 'package:mac_queries/screen/start_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('Integration Test from SplashScreen to Login Screens', () {
    testWidgets('Navigates through screens correctly',
        (WidgetTester tester) async {
      main();
      await tester.pumpAndSettle();

      await tester.pumpAndSettle(const Duration(seconds: 4));

      expect(find.byType(StartScreen), findsOneWidget);

      await tester.tap(find.byKey(const Key('oneLoginButton')));
      await tester.pumpAndSettle();

      expect(find.byType(OneLoginScreen), findsOneWidget);

      await tester.pageBack();
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('guestLoginButton')));
      await tester.pumpAndSettle();

      expect(find.byType(GuestLoginScreen), findsOneWidget);
    });
  });
}
