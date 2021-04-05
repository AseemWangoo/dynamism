import 'package:flutter/material.dart';

import 'package:screener/home/components/list/list.component.dart';
import 'package:screener/home/utils/strings.dart';
import 'package:screener/locator.dart';
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
    return CustomScaffold(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SpacerVertical(20),
            _Intro(),
            SpacerVertical(32),
            _Carousel(),
            SpacerVertical(64),
            _Bottom(),
          ],
        ),
      ),
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
        const Placeholder(),
      ],
    );
  }
}

class _Carousel extends StatelessWidget {
  const _Carousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        const Placeholder(),
      ],
    );
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
