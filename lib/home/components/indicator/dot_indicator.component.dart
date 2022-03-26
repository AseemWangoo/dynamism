import 'package:flutter/material.dart';

import 'package:app_theme/app_theme.dart' show AppColors;

class DotIndicatorComponent extends StatelessWidget {
  const DotIndicatorComponent({
    Key? key,
    this.isSelected = false,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.0,
      height: 8.0,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.cardBorder),
        color: isSelected ? AppColors.primaryBlue : Colors.transparent,
      ),
    );
  }
}
