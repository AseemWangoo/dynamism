import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:shared_components/shared_components.dart';

import 'package:provider/provider.dart';

import 'package:screener/home/components/carousel_card/carousel_card.component.dart';
import 'package:screener/home/components/indicator/dot_indicator.component.dart';
import 'package:screener/home/model/carousel.model.dart';

import 'package:screener/home/utils/strings.dart';

import 'package:screener/home/view_models/home.viewmodel.dart';

class CarouselTemplate extends StatefulWidget {
  const CarouselTemplate({Key? key}) : super(key: key);

  @override
  _CarouselTemplateState createState() => _CarouselTemplateState();
}

class _CarouselTemplateState extends State<CarouselTemplate> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeViewModel>().homeModel;

    return ColumnSpacer(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacerWidget: const SpacerVertical(56),
      children: [
        Row(
          children: [
            const H3TextComponent(
              text: HomeStrings.crslTitle,
            ),
            const Spacer(),
            ..._indicators(model),
          ],
        ),
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1,
            enableInfiniteScroll: false,
            height: 588,
            viewportFraction: 0.99,
            onPageChanged: (index, reason) {
              setState(() => _current = index);
            },
          ),
          items: items(model),
        ),
      ],
    );
  }

  List<Widget> _indicators(CarouselModel model) {
    final list = <Widget>[];

    for (var i = 0; i < model.items.length; i++) {
      list.add(
        DotIndicatorComponent(isSelected: _current == i),
      );
    }

    return list;
  }

  List<Widget> items(CarouselModel model) {
    final list = <Widget>[];

    for (var i = 0; i < model.items.length; i++) {
      final item = model.items[i];

      if (i == model.items.length - 1) {
        list.add(
          CarouselCardComponent(
            imageUrl: item.imageUrl!,
            text: item.header!,
            optionTitle: item.title!,
            optionSubtitle: item.subtitle!,
            optionDesc: item.desc!,
          ),
        );
      } else {
        list.add(
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CarouselCardComponent(
              imageUrl: item.imageUrl!,
              text: item.header!,
              optionTitle: item.title!,
              optionSubtitle: item.subtitle!,
              optionDesc: item.desc!,
            ),
          ),
        );
      }
    }

    return list;
  }
}
