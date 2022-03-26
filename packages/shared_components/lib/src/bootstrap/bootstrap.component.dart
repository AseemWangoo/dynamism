import 'package:flutter/material.dart';

class BootstrapComponent extends StatelessWidget {
  const BootstrapComponent({
    Key? key,
    required this.child,
    this.flexFactor = 4,
    this.alignment = Alignment.center,
  })  : assert(
          flexFactor >= 1 && flexFactor <= 4,
          'Flex factor should be between 1 and 4',
        ),
        super(key: key);

  final Widget child;
  final int flexFactor;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    //
    return FractionallySizedBox(
      alignment: alignment,
      widthFactor: flexFactor / 4,
      child: child,
    );
  }
}
