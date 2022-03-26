import 'package:flutter/material.dart';

import 'package:app_theme/app_theme.dart' show AppColors;

typedef CardPressed = void Function();

class ListComponent extends StatelessWidget {
  const ListComponent({
    Key? key,
    required this.onPressed,
    this.text = 'Some text',
  }) : super(key: key);

  final String text;
  final CardPressed onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.baseElevation),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.caption,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
