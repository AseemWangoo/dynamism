import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:screener/main.dart' as app;

import 'robots/home_robot.dart';
import 'robots/secondscreen_robot.dart';
import 'robots/thirdscreen_robot.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;

  HomeRobot homeRobot;
  SecondScreenRobot secondScreenRobot;
  ThirdScreenRobot thirdScreenRobot;

  group('e2e test', () {
    testWidgets('whole app', (WidgetTester tester) async {
      app.main();
      homeRobot = HomeRobot(tester);
      secondScreenRobot = SecondScreenRobot(tester);
      thirdScreenRobot = ThirdScreenRobot(tester);

      // await tester.scrollUntilVisible(
      //   itemFinder,
      //   -450,
      // );
      // await tester.pump();

      // For recording perf
      // await binding.watchPerformance(() async {
      //   await tester.fling(listFinder, Offset(0, -500), 10000);
      //   await tester.pumpAndSettle();
      // });
      await homeRobot.findTitle();

      await homeRobot.scrollThePage();

      await homeRobot.clickFirstButton();
      await secondScreenRobot.findTitle();
      await secondScreenRobot.scrollThePage();
      await secondScreenRobot.scrollThePage(scrollUp: true);
      await secondScreenRobot.goBack();

      await homeRobot.clickSecondButton();
      await thirdScreenRobot.findTitle();
      await thirdScreenRobot.scrollThePage();
      await thirdScreenRobot.scrollThePage(scrollUp: true);
      await thirdScreenRobot.goBack();

      await homeRobot.scrollThePage(scrollUp: true);
    });
  });
}
