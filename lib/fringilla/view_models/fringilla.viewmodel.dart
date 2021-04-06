import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:screener/fringilla/model/fringilla.model.dart';

import 'package:screener/shared/view_models/loading.viewmodel.dart';

abstract class FringillaVM extends LoadingViewModel {
  Future<void> fetchData();
  FringillaModel get model;
}

class FringillaViewModel extends FringillaVM {
  FringillaViewModel();

  @override
  FringillaModel get model => _model;

  set model(FringillaModel model) {
    _model = model;
    notifyListeners();
  }

  @override
  Future<void> fetchData() async {
    try {
      isLoading = true;

      // await Future.delayed(const Duration(milliseconds: 800));

      final resp = await rootBundle.loadString('assets/data/third_screen.json');
      model = fringillaModelFromJson(resp);
    } catch (exc) {
      debugPrint('Error in _fetchData : ${exc.toString()}');
    }

    isLoading = false;
    notifyListeners();
  }

  // INTERNALS

  FringillaModel _model = FringillaModel();
}
