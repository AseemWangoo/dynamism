import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';
import 'package:screener/pellen/components/row_with_number/numbered_row.component.dart';
import 'package:screener/pellen/utils/strings.dart';
import 'package:screener/pellen/view_models/pellen.viewmodel.dart';
import 'package:screener/shared/assets/image.assets.dart';
import 'package:shared_components/shared_components.dart';

class PellenView extends StatelessWidget {
  const PellenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SingleChildScrollView(
        key: const Key('pellen singleChildScrollView'),
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const H3TextComponent(
              text: PellenStrings.title,
            ),
            const SpacerVertical(20),
            Text(
              PellenStrings.subtitle,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SpacerVertical(28),
            const _SectionOne(),
            GooglePayButton(
              paymentConfigurationAsset: JsonAssets.gpayAsset,
              paymentItems: paymentItems,
              onPaymentResult: onGooglePayResult,
              style: GooglePayButtonStyle.white,
              margin: const EdgeInsets.only(top: 15.0),
              width: double.maxFinite,
              loadingIndicator: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            const SpacerVertical(64),
            const _SectionTwo(),
            const SpacerVertical(32),
          ],
        ),
      ),
    );
  }

  List<PaymentItem> get paymentItems {
    const _paymentItems = [
      PaymentItem(
        label: 'Total',
        amount: '1.99',
        status: PaymentItemStatus.final_price,
      ),
    ];

    return _paymentItems;
  }

  void onGooglePayResult(dynamic paymentResult) {
    debugPrint(paymentResult.toString());
  }
}

class _SectionOne extends StatelessWidget {
  const _SectionOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PellenViewModel>(context);

    return ColumnSpacer(
      spacerWidget: const SpacerVertical(50),
      children: [
        ImageComponent(
          assetName: model.topSection().first.url,
        ),
        ListView.builder(
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
        ),
      ],
    );
  }
}

class _SectionTwo extends StatelessWidget {
  const _SectionTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PellenViewModel>(context);

    return Column(
      children: [
        ImageComponent(assetName: model.bottomSection().first.url),
        const SpacerVertical(44),
        ListView.builder(
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
        ),
        const SpacerVertical(20),
        RawGooglePayButton(
          onPressed: () {},
          style: GooglePayButtonStyle.white,
          type: GooglePayButtonType.plain,
        ),
      ],
    );
  }
}
