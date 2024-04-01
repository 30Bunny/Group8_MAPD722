// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:group8_mapd722/main.dart';
import 'package:group8_mapd722/network/network_repository.dart';
import 'package:group8_mapd722/util/util.dart';

void main() {

  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });

  test('Right Email test', () {
    expect(Util.isValidEmail('bansidholakia@gmail.com'), true);
  });

  test('Wrong Email test', () {
    expect(Util.isValidEmail('test@gmail'), false);
  });

  test('Fetch patient list API call', () async {
    final response = await NetworkRepository.get('http://127.0.0.1:3000/patients');

    expect(response.statusCode, 200);
  });

  testWidgets('Widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Home Screen
    expect(find.text('Add New Patient'), findsOneWidget);
    expect(find.text('View All Patients'), findsOneWidget);
    expect(find.text('View Empty Patient'), findsNothing);


  });
}
