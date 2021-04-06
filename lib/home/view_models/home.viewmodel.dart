import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter/services.dart' show rootBundle;

import 'package:screener/home/model/carousel.model.dart';

import 'package:screener/shared/view_models/loading.viewmodel.dart';

class HomeViewModel extends LoadingViewModel {
  HomeViewModel();

  CarouselModel get homeModel => _homeModel;

  set homeModel(CarouselModel homeModel) {
    _homeModel = homeModel;
    notifyListeners();
  }

  Future<void> fetchData() async {
    try {
      isLoading = true;

      final resp = await rootBundle.loadString('assets/data/first_screen.json');
      _homeModel = carouselModelFromJson(resp);
    } catch (exc) {
      debugPrint('Error in _fetchData : ${exc.toString()}');
    }

    isLoading = false;
    notifyListeners();
  }

  // INTERNALS
  CarouselModel _homeModel = CarouselModel();
}
