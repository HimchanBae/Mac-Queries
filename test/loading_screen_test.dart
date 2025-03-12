import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mac_queries/screen/loading_screen.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';

void main() {
  setUpAll(() {
    final mockFirebaseDatabase = MockFirebaseDatabase.instance;
  });

  group('LoadingScreen Tests', () {
    testWidgets('LoadingScreen has an image, progress indicator, and text',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoadingScreen()));

      await tester.pump();
      await tester.pump(const Duration(seconds: 3));

      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Hold tight...'), findsOneWidget);

      await tester.pumpAndSettle();
    });
  });
}
