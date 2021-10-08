import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screener/fringilla/utils/strings.dart';

class ThirdScreenRobot {
  const ThirdScreenRobot(this.tester);

  final WidgetTester tester;

  Future<void> findTitle() async {
    await tester.pumpAndSettle();
    expect(find.text(FringillaStrings.title), findsOneWidget);
    sleep(const Duration(seconds: 2));
  }

  Future<void> goBack() async {
    await tester.pageBack();
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 2));
  }

  Future<void> scrollThePage({bool scrollUp = false}) async {
    final listFinder = find.byKey(const Key('fringilla singleChildScrollView'));

    if (scrollUp) {
      await tester.fling(listFinder, const Offset(0, 500), 10000);
      await tester.pumpAndSettle();

      expect(find.text(FringillaStrings.title), findsOneWidget);
    } else {
      await tester.fling(listFinder, const Offset(0, -500), 10000);
      await tester.pumpAndSettle();

      expect(find.text('Lorem Ipsum'), findsOneWidget);
    }
  }
}
