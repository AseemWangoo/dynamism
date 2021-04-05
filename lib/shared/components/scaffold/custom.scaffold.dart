import 'package:flutter/material.dart';

import 'package:screener/shared/styles/colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key key,
    @required this.child,
    this.enableGutter = true,
  }) : super(key: key);

  final Widget child;
  final bool enableGutter;

  Widget get _checkGutter {
    if (enableGutter) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: child,
      );
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(child: _checkGutter),
    );
  }
}
