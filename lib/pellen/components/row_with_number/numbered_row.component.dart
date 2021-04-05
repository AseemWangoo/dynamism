import 'package:flutter/material.dart';

import 'package:screener/pellen/components/text/caption_text.component.dart';
import 'package:screener/shared/components/spacers/spacer.component.dart';
import 'package:screener/shared/styles/colors.dart';

class NumberedRowComponent extends CaptionTextComponent {
  const NumberedRowComponent({
    Key key,
    String text = 'Some text',
    this.number = 1,
  }) : super(text: text, key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$number.',
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: AppColors.textGrey),
        ),
        const SpacerHorizontal(12),
        Expanded(child: Text(text)),
      ],
    );
  }
}
