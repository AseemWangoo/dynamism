import 'package:flutter/material.dart';
import 'package:screener/shared/styles/colors.dart';

class DotIndicatorComponent extends StatelessWidget {
  const DotIndicatorComponent({
    Key key,
    this.isSelected = false,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.0,
      height: 8.0,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.primaryBlue : AppColors.pressedBlue,
      ),
    );
  }
}
