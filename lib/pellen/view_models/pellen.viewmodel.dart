import 'package:flutter/material.dart';

import 'package:screener/pellen/model/pellen.model.dart';
import 'package:screener/pellen/utils/strings.dart';

class PellenViewModel extends ChangeNotifier {
  // TODO(Aseem): Replace URL
  List<PellenModel> topSection() {
    final list = <PellenModel>[
      PellenModel(
        [PellenStrings.topPt1, PellenStrings.topPt2, PellenStrings.topPt3],
        'url',
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
        'url',
      ),
    ];

    return list;
  }
}
