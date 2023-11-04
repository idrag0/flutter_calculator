import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Calculator view", () {
    testWidgets("Calcukator view Test", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byKey(const Key("Result")), findsOneWidget);
      expect(find.byKey(const Key("displayOne")), findsOneWidget);
      expect(find.byKey(const Key("displayTwo")), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);
    });
    testWidgets("operation", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.enterText(find.byKey(Key("displayOne")), "20");
      await tester.enterText(find.byKey(Key("displayTwo")), "5");

      await tester.tap(find.byIcon(CupertinoIcons.add));
      await tester.pump();
      expect(find.text("25"), findsOneWidget);

      await tester.tap(find.byIcon(CupertinoIcons.minus));
      await tester.pump();
      expect(find.text("15"), findsOneWidget);

      await tester.tap(find.byIcon(CupertinoIcons.multiply));
      await tester.pump();
      expect(find.text("100"), findsOneWidget);

      await tester.tap(find.byIcon(CupertinoIcons.divide));
      await tester.pump();
      expect(find.text("4.0"), findsOneWidget);
    });
  });
}
