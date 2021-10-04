import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:screener/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end-test', () {
    testWidgets('find text with name', (WidgetTester tester) async {
      app.main();

      await tester.pump();

      expect(find.text('Fames volutpat.'), findsOneWidget);
      await tester.pumpAndSettle();
    });
  });
}
