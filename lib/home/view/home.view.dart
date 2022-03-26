import 'package:app_theme/app_theme.dart' show AppColors;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screener/home/components/list/list.component.dart';
import 'package:screener/home/templates/carousel/carousel.template.dart';
import 'package:screener/home/utils/strings.dart';
import 'package:screener/home/view_models/home.viewmodel.dart';
import 'package:screener/locator.dart';
import 'package:screener/shared/assets/image.assets.dart';
import 'package:screener/shared/routes/routes.dart';
import 'package:screener/shared/services/navigation.service.dart';
import 'package:shared_components/shared_components.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    viewModel = Provider.of<HomeViewModel>(context, listen: false);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      viewModel.fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (_, model, child) {
        if (model.isLoading) {
          return child ?? const SizedBox();
        }

        return CustomScaffold(
          enableGutter: false,
          child: SingleChildScrollView(
            key: const Key('singleChildScrollView'),
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
                  child: CarouselTemplate(),
                ),
                SpacerVertical(64),
                Padding(
                  key: Key('desiredContainer'),
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _Bottom(),
                ),
                SpacerVertical(32),
              ],
            ),
          ),
        );
      },
      child: LoadingComponent(),
    );
  }
}

class _Intro extends StatelessWidget {
  const _Intro({Key? key}) : super(key: key);

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
              .caption!
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

class _Bottom extends StatelessWidget {
  const _Bottom({Key? key}) : super(key: key);

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
          key: const Key(HomeStrings.bOp1),
          onPressed: () {
            navService.nav.pushNamed(NamedRoute.pellen);
          },
          text: HomeStrings.bOp1,
        ),
        ListComponent(
          key: const Key(HomeStrings.bOp2),
          onPressed: () {
            navService.nav.pushNamed(NamedRoute.fringilla);
          },
          text: HomeStrings.bOp2,
        ),
      ],
    );
  }
}
