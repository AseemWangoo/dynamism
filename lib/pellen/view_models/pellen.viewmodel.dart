import 'package:flutter/material.dart';

import 'package:screener/pellen/model/pellen.model.dart';
import 'package:screener/pellen/utils/strings.dart';
import 'package:screener/shared/assets/image.assets.dart';

class PellenViewModel extends ChangeNotifier {
  List<PellenModel> topSection() {
    final list = <PellenModel>[
      PellenModel(
        [PellenStrings.topPt1, PellenStrings.topPt2, PellenStrings.topPt3],
        ImageAssets.img300.assetName,
      ),
    ];

    return list;
  }

  List<PellenModel> bottomSection() {
    final list = <PellenModel>[
      PellenModel(
        [
          PellenStrings.btmPt1,
          PellenStrings.btmPt2,
          PellenStrings.btmPt3,
          PellenStrings.btmPt4,
          PellenStrings.btmPt5,
          PellenStrings.btmPt6
        ],
        ImageAssets.img400.assetName,
      ),
    ];

    return list;
  }
}
