import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screener/pellen/utils/strings.dart';
import 'package:screener/pellen/view_models/pellen.viewmodel.dart';

import 'package:screener/shared/components/scaffold/custom.scaffold.dart';
import 'package:screener/shared/components/spacers/spacer.component.dart';
import 'package:screener/shared/components/text/h3_text.component.dart';

import '../components/row_with_number/numbered_row.component.dart';

class PellenView extends StatelessWidget {
  const PellenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            H3TextComponent(
              text: PellenStrings.title,
            ),
            SpacerVertical(20),
            Text(
              PellenStrings.subtitle,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SpacerVertical(28),
            Placeholder(),
            _SectionOne(),
            Placeholder(),
            _SectionTwo(),
          ],
        ),
      ),
    );
  }
}

class _SectionOne extends StatelessWidget {
  const _SectionOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PellenViewModel>(context);

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, int i) {
        final items = model.topSection().first.text.length;

        if (i == items - 1) {
          return NumberedRowComponent(
            number: i + 1,
            text: model.topSection().first.text[i],
          );
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: NumberedRowComponent(
            number: i + 1,
            text: model.topSection().first.text[i],
          ),
        );
      },
      itemCount: model.topSection().first.text.length,
      shrinkWrap: true,
    );
  }
}

class _SectionTwo extends StatelessWidget {
  const _SectionTwo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PellenViewModel>(context);

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, int i) {
        final items = model.bottomSection().first.text.length;

        if (i == items - 1) {
          return NumberedRowComponent(
            number: i + 1,
            text: model.bottomSection().first.text[i],
          );
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: NumberedRowComponent(
            number: i + 1,
            text: model.bottomSection().first.text[i],
          ),
        );
      },
      itemCount: model.bottomSection().first.text.length,
      shrinkWrap: true,
    );
  }
}
