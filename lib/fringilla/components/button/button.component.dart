import 'package:flutter/material.dart';

import 'package:app_theme/app_theme.dart' show AppColors;

typedef ButtonPressed = void Function();

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    Key? key,
    required this.onPressed,
    this.text = 'Lorem Ipsum',
  }) : super(key: key);

  final ButtonPressed onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.buttonOutline),
        ),
        child: Text(text, style: Theme.of(context).textTheme.button),
      ),
    );
  }
}
