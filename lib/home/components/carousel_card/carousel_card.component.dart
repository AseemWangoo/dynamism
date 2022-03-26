import 'package:flutter/material.dart';

import 'package:shared_components/shared_components.dart';

import 'package:app_theme/app_theme.dart';

class CarouselCardComponent extends ImageCacherComponent {
  const CarouselCardComponent({
    Key? key,
    required String imageUrl,
    double height = 300,
    double width = 300,
    this.text = 'Some text',
    this.optionTitle = 'Some title',
    this.optionSubtitle = 'Some sub',
    this.optionDesc = 'Some desc',
  }) : super(key: key, imageUrl: imageUrl, height: height, width: width);

  final String text;
  final String optionTitle;
  final String optionSubtitle;
  final String optionDesc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cardBorder),
        color: AppColors.cardGrey,
      ),
      padding: const EdgeInsets.fromLTRB(22, 24, 0, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: TextStyles.display),
          const SpacerVertical(20),
          ImageCacherComponent(
            imageUrl: imageUrl,
            height: height,
            width: width,
          ),
          const SpacerVertical(48),
          _Internal(
            optionTitle: optionTitle,
            optionSubtitle: optionSubtitle,
            optionDesc: optionDesc,
          ),
        ],
      ),
    );
  }
}

class _Internal extends StatelessWidget {
  const _Internal({
    Key? key,
    this.optionTitle = 'Some title',
    this.optionSubtitle = 'Some sub',
    this.optionDesc = 'Some desc',
  }) : super(key: key);

  final String optionTitle;
  final String optionSubtitle;
  final String optionDesc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H3TextComponent(text: optionTitle),
        const SpacerVertical(12),
        Text(optionSubtitle, style: Theme.of(context).textTheme.bodyText1),
        const SpacerVertical(18),
        Text(optionDesc, style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}
