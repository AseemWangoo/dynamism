import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

class AppTheme {
  AppTheme._();

  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: AppColors.bg,
      errorColor: AppColors.error,
    ),
    textTheme: TextTheme(
      headline1: TextStyles.headline1,
      headline2: TextStyles.headline2,
      headline3: TextStyles.headline3,
      headline4: TextStyles.headline4,
      button: TextStyles.subtitle,
      caption: TextStyles.caption,
      bodyText1: TextStyles.bodyRegular,
      bodyText2: TextStyles.bodyBold,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
