import 'package:flutter/material.dart';
import 'package:screener/shared/styles/colors.dart';

typedef ButtonPressed = void Function();

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    Key key,
    @required this.onPressed,
    this.text = 'Lorem Ipsum',
  })  : assert(onPressed != null),
        super(key: key);

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
        child: Text(text),
      ),
    );
  }
}
