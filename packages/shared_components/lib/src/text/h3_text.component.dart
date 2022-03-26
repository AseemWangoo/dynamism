import 'package:flutter/material.dart';

class H3TextComponent extends StatelessWidget {
  const H3TextComponent({Key? key, this.text = 'Some text'}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headline3);
  }
}
