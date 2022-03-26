import 'package:flutter/services.dart';
import 'package:screener/home/model/carousel.model.dart';

abstract class HomeRepo {
  Future<CarouselModel> fetchData();
}

class HomeRepoImpl extends HomeRepo {
  @override
  Future<CarouselModel> fetchData() async {
    await Future.delayed(const Duration(milliseconds: 1800));

    final resp = await rootBundle.loadString('assets/data/first_screen.json');
    return carouselModelFromJson(resp);
  }
}
