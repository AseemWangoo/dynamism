import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screener/fringilla/components/button/button.component.dart';
import 'package:screener/fringilla/components/card/card.component.dart';
import 'package:screener/fringilla/components/webview/webview.component.dart';
import 'package:screener/fringilla/utils/strings.dart';
import 'package:screener/fringilla/view_models/fringilla.viewmodel.dart';
import 'package:screener/shared/services/navigation.service.dart';
import 'package:shared_components/shared_components.dart';

import '../../locator.dart';

class FringillaView extends StatefulWidget {
  const FringillaView({Key? key}) : super(key: key);

  @override
  State<FringillaView> createState() => _FringillaViewState();
}

class _FringillaViewState extends State<FringillaView> {
  late FringillaViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<FringillaViewModel>(context, listen: false);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      viewModel.fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FringillaViewModel>(
      builder: (_, model, child) {
        if (model.isLoading) {
          return child ?? const SizedBox();
        }

        return CustomScaffold(
          child: SingleChildScrollView(
            key: const Key('fringilla singleChildScrollView'),
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const H3TextComponent(
                  text: FringillaStrings.title,
                ),
                const SpacerVertical(20),
                Text(
                  FringillaStrings.subtitle,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SpacerVertical(40),
                const _Items(),
                const SpacerVertical(20),
                ButtonComponent(
                  onPressed: () {},
                ),
                const SpacerVertical(20),
              ],
            ),
          ),
        );
      },
      child: LoadingComponent(),
    );
  }
}

class _Items extends StatelessWidget {
  const _Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FringillaViewModel>(context).model;
    final navService = locator<NavigationService>();

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: model.items.length,
      itemBuilder: (_, int i) {
        return Padding(
          key: Key('fringilla_item_$i'),
          padding: const EdgeInsets.only(bottom: 16),
          child: CardComponent(
            onPressed: () {
              navService.nav.push(MaterialPageRoute(
                builder: (_) => WebViewComponent(url: model.items[i].urlLink!),
              ));
            },
            text: model.items[i].description!,
          ),
        );
      },
      shrinkWrap: true,
    );
  }
}
