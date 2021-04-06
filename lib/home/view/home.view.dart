import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:screener/home/components/carousel_card/carousel_card.component.dart';

import 'package:screener/home/components/list/list.component.dart';
import 'package:screener/home/models/carousel.model.dart';
import 'package:screener/home/utils/strings.dart';
import 'package:screener/home/view_models/home.viewmodel.dart';
import 'package:screener/locator.dart';
import 'package:screener/shared/assets/image.assets.dart';
import 'package:screener/shared/components/image/image.component.dart';
import 'package:screener/shared/components/loading/loading.component.dart';
import 'package:screener/shared/components/notifier/notifier.component.dart';
import 'package:screener/shared/components/scaffold/custom.scaffold.dart';
import 'package:screener/shared/components/spacers/column_spacer.component.dart';
import 'package:screener/shared/components/spacers/spacer.component.dart';
import 'package:screener/shared/components/text/h3_text.component.dart';
import 'package:screener/shared/routes/routes.dart';
import 'package:screener/shared/services/navigation.service.dart';
import 'package:screener/shared/styles/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotifierWidget<HomeViewModel>(
      builder: (_, model, child) {
        if (model.isLoading) {
          return child;
        }

        return CustomScaffold(
          enableGutter: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SpacerVertical(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _Intro(),
                ),
                SpacerVertical(32),
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: _Carousel(),
                ),
                SpacerVertical(64),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _Bottom(),
                ),
                SpacerVertical(32),
              ],
            ),
          ),
        );
      },
      model: locator<HomeViewModel>(),
      child: LoadingComponent(),
    );
  }
}

class _Intro extends StatelessWidget {
  const _Intro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const H3TextComponent(
          text: HomeStrings.title,
        ),
        const SpacerVertical(16),
        Text(
          HomeStrings.nam,
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: AppColors.textGrey),
        ),
        const SpacerVertical(8),
        Row(
          children: [
            Text(
              HomeStrings.euismod,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const Spacer(),
            const Icon(
              Icons.edit_outlined,
              color: Colors.white,
            ),
          ],
        ),
        const SpacerVertical(24),
        ImageComponent(
          assetName: ImageAssets.img300.assetName,
          height: 300,
        ),
      ],
    );
  }
}

class _Carousel extends StatelessWidget {
  const _Carousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeViewModel>().homeModel;

    return ColumnSpacer(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacerWidget: const SpacerVertical(56),
      children: [
        Row(
          children: const [
            H3TextComponent(
              text: HomeStrings.crslTitle,
            ),
            Text('Todo')
          ],
        ),
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1,
            enableInfiniteScroll: false,
            height: 588,
            viewportFraction: 0.99,
          ),
          items: items(model),
        ),
      ],
    );
  }

  List<Widget> items(CarouselModel model) {
    final list = <Widget>[];

    for (var i = 0; i < model.items.length; i++) {
      final item = model.items[i];

      if (i == model.items.length - 1) {
        list.add(
          CarouselCardComponent(
            imageUrl: item.imageUrl,
            text: item.header,
            optionTitle: item.title,
            optionSubtitle: item.subtitle,
            optionDesc: item.desc,
          ),
        );
      } else {
        list.add(
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CarouselCardComponent(
              imageUrl: item.imageUrl,
              text: item.header,
              optionTitle: item.title,
              optionSubtitle: item.subtitle,
              optionDesc: item.desc,
            ),
          ),
        );
      }
    }

    return list;
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navService = locator<NavigationService>();

    return ColumnSpacer(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacerWidget: const SpacerVertical(16),
      children: [
        Text(
          HomeStrings.bottom,
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          HomeStrings.bottomDesc,
          style: Theme.of(context).textTheme.caption,
        ),
        ListComponent(
          onPressed: () {
            navService.nav.pushNamed(NamedRoute.pellen);
          },
          text: HomeStrings.bOp1,
        ),
        ListComponent(
          onPressed: () {
            navService.nav.pushNamed(NamedRoute.fringilla);
          },
          text: HomeStrings.bOp2,
        ),
      ],
    );
  }
}
