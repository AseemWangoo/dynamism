import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({Key? key, required this.assetName, this.height = 200})
      : super(key: key);

  final String assetName;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image(
      height: height,
      image: AssetImage(assetName),
      fit: BoxFit.fitWidth,
      width: double.maxFinite,
    );
  }
}
