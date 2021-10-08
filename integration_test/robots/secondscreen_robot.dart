import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screener/pellen/utils/strings.dart';

class SecondScreenRobot {
  const SecondScreenRobot(this.tester);

  final WidgetTester tester;

  Future<void> findTitle() async {
    await tester.pumpAndSettle();
    final pellenFinder = find.text(PellenStrings.title);
    expect(pellenFinder, findsOneWidget);
    sleep(const Duration(seconds: 2));
  }

  Future<void> goBack() async {
    await tester.pageBack();
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 2));
  }

  Future<void> scrollThePage({bool scrollUp = false}) async {
    final listFinder = find.byKey(const Key('pellen singleChildScrollView'));

    if (scrollUp) {
      await tester.fling(listFinder, const Offset(0, 500), 10000);
      await tester.pumpAndSettle();

      expect(find.text(PellenStrings.title), findsOneWidget);
    } else {
      await tester.fling(listFinder, const Offset(0, -500), 10000);
      await tester.pumpAndSettle();

      expect(find.text('Lorem Ipsum'), findsNothing);
    }
  }
}
