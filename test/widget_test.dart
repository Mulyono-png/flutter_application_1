// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/main.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('bottom navigation switches between pages', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Login Page'), findsOneWidget);
    expect(find.text('input username'), findsOneWidget);
    expect(find.text('input password'), findsOneWidget);

    Get.toNamed(Routes.main_menu);
    await tester.pumpAndSettle();

    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('Makanan'), findsOneWidget);
    expect(find.text('Soto Ayam'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);

    await tester.tap(find.text('History'));
    await tester.pumpAndSettle();
    expect(find.text('History Page'), findsOneWidget);

    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();
    expect(find.text('pandajawacuy'), findsOneWidget);
    expect(find.text('Edit profile'), findsOneWidget);
    expect(find.text('View archive'), findsOneWidget);

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(find.text('Home Page'), findsOneWidget);
  });
}
