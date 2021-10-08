import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    final closeIconFinder = find.byIcon(Icons.close);
    await tester.tap(closeIconFinder);
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 1));

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
      sleep(const Duration(seconds: 2));
    } else {
      await tester.fling(listFinder, const Offset(0, -500), 10000);
      await tester.pumpAndSettle();

      expect(find.text('Lorem Ipsum'), findsOneWidget);
    }
  }

  Future<void> clickTile(int item) async {
    assert(item != null && item >= 0 && item <= 5);
    final key = 'fringilla_item_${item.toString()}';

    final itemFinder = find.byKey(Key(key));
    await tester.tap(itemFinder);
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 2));
  }
}
