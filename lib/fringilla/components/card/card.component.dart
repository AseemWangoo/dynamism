import 'package:flutter/material.dart';

import 'package:app_theme/app_theme.dart' show AppColors;

typedef CardPressed = void Function();

class CardComponent extends StatelessWidget {
  const CardComponent({
    Key? key,
    required this.onPressed,
    this.text = 'Some text',
  }) : super(key: key);

  final CardPressed onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: AppColors.cardGrey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
