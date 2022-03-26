import 'package:flutter/foundation.dart';

import 'package:screener/home/model/carousel.model.dart';
import 'package:screener/home/repository/home_repo.dart';

import 'package:screener/shared/view_models/loading.viewmodel.dart';

class HomeViewModel extends LoadingViewModel {
  HomeViewModel({
    required this.repo,
  });

  final HomeRepo repo;

  CarouselModel get homeModel => _homeModel;

  set homeModel(CarouselModel homeModel) {
    _homeModel = homeModel;
    notifyListeners();
  }

  Future<void> fetchData() async {
    try {
      isLoading = true;

      _homeModel = await repo.fetchData();
    } catch (exc) {
      debugPrint('Error in _fetchData : ${exc.toString()}');
    }

    isLoading = false;
    notifyListeners();
  }

  // INTERNALS
  CarouselModel _homeModel = CarouselModel();
}
