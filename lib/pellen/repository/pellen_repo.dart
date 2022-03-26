import 'package:screener/pellen/model/pellen.model.dart';
import 'package:screener/pellen/utils/strings.dart';
import 'package:screener/shared/assets/image.assets.dart';

abstract class PellenRepo {
  List<PellenModel> topSection();
  List<PellenModel> bottomSection();
}

class PellenRepoImpl extends PellenRepo {
  @override
  List<PellenModel> bottomSection() {
    final list = <PellenModel>[
      PellenModel(
        [PellenStrings.topPt1, PellenStrings.topPt2, PellenStrings.topPt3],
        ImageAssets.img300.assetName,
      ),
    ];

    return list;
  }

  @override
  List<PellenModel> topSection() {
    final list = <PellenModel>[
      PellenModel(
        [
          PellenStrings.btmPt1,
          PellenStrings.btmPt2,
          PellenStrings.btmPt3,
          PellenStrings.btmPt4,
          PellenStrings.btmPt5,
          PellenStrings.btmPt6,
          PellenStrings.btmPt7,
        ],
        ImageAssets.img300.assetName,
      ),
    ];

    return list;
  }
}
