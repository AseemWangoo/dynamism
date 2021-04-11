import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shared_components/shared_components.dart';

void main() {
  testGoldens('h3 text component', (tester) async {
    final builder = DeviceBuilder()
      ..addScenario(
        widget: H3TextComponent(),
        name: 'default h3 text component',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'flutter_h3_text_component');
  });
}
