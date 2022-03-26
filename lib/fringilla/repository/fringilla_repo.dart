import 'package:flutter/services.dart';
import 'package:screener/fringilla/model/fringilla.model.dart';

abstract class FringillaRepo {
  Future<FringillaModel> fetchData();
}

class FringillaRepoImpl implements FringillaRepo {
  @override
  Future<FringillaModel> fetchData() async {
    final resp = await rootBundle.loadString('assets/data/third_screen.json');
    final model = fringillaModelFromJson(resp);

    return model;
  }
}
