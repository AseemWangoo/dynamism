import 'package:flutter/material.dart';

class CaptionTextComponent extends StatelessWidget {
  const CaptionTextComponent({Key? key, this.text = 'Some text'})
      : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.caption);
  }
}
