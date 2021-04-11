import 'package:flutter/rendering.dart' show Color;

import '../src/extensions/color.dart';

class AppColors {
  AppColors._();

  static Color darkblue = HexColor.fromHex('#0A0E14');
  static Color bg = HexColor.fromHex('#141D28');
  static Color error = HexColor.fromHex('#D0353F');
  static Color success = HexColor.fromHex('#9BC438');
  static Color pending = HexColor.fromHex('#E6AC28');

  static Color pressedBlue = HexColor.fromHex('#0A497B');
  static Color primaryBlue = HexColor.fromHex('#0076CE');

  static Color baseElevation = const Color.fromRGBO(126, 126, 126, 0.7);

  static Color textGrey = HexColor.fromHex('#A0AEBB');
  static Color cardGrey = const Color.fromRGBO(126, 126, 126, 0.15);
  static Color buttonOutline = const Color.fromRGBO(0, 118, 206, 1);

  static Color cardBorder = const Color.fromRGBO(113, 116, 123, 1);
}
