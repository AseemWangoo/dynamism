import 'package:flutter/material.dart';

import 'spacer.component.dart';

class RowSpacer extends StatelessWidget {
  /// This snippet shows O/P of [RowSpacer].
  ///
  /// ```dart
  /// I/P : [19, 21]
  /// O/P : [19, 7, 21]
  ///
  /// I/P : [19, 21, 23]
  /// O/P : [19, 7, 21, 7, 23]
  /// ```
  /// {@end-tool}
  const RowSpacer({
    Key? key,
    required this.children,
    this.spacerWidget = const SpacerHorizontal(8),
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
  })  : assert(
          children.length > 1,
          'children should be more than 1',
        ),
        super(key: key);

  final List<Widget> children;

  final Widget spacerWidget;

  final CrossAxisAlignment crossAxisAlignment;

  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _spacedChildren = <Widget>[];

    for (int i = 0; i < children.length; i++) {
      if (i == 0) {
        _spacedChildren.add(children[i]);
      } else if (i == children.length - 1) {
        _spacedChildren.add(spacerWidget);
        _spacedChildren.add(children[i]);
      } else {
        _spacedChildren.add(spacerWidget);
        _spacedChildren.add(children[i]);
      }
    }

    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: _spacedChildren,
    );
  }
}
