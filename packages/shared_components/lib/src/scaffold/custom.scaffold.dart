import 'package:flutter/material.dart';

import 'package:app_theme/app_theme.dart' show AppColors;

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key? key,
    required this.child,
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
      appBar: AppBar(backgroundColor: AppColors.bg),
      backgroundColor: AppColors.bg,
      body: SafeArea(child: _checkGutter),
    );
  }
}
