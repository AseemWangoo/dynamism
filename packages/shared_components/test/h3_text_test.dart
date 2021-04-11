import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/shared_components.dart';

void main() {
  Widget makeTestableWidget(Widget child) {
    return MaterialApp(home: child);
  }

  group('test for h3 text', () {
    testWidgets('H3 Widget has text', (WidgetTester tester) async {
      final widget = H3TextComponent(text: 'Test text');

      await tester.pumpWidget(makeTestableWidget(widget));

      final textFinder = find.text('Test text');
      expect(textFinder, findsOneWidget);
    });
  });
}
