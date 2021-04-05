import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screener/fringilla/model/fringilla.model.dart';

import 'package:screener/shared/view_models/loading.viewmodel.dart';

class FringillaViewModel extends LoadingViewModel {
  FringillaViewModel();

  FringillaModel get model => _model;

  set model(FringillaModel model) {
    _model = model;
    notifyListeners();
  }

  Future<void> fetchData() async {
    try {
      isLoading = true;

      final resp = await rootBundle.loadString('assets/data/third_screen.json');
      model = fringillaModelFromJson(resp);
    } catch (exc) {
      debugPrint('Error in _fetchData : ${exc.toString()}');
    }

    isLoading = false;
    notifyListeners();
  }

  // INTERNALS

  FringillaModel _model;
}
