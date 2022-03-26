import 'package:get_it/get_it.dart';
import 'package:screener/fringilla/repository/fringilla_repo.dart';

import 'home/view_models/home.viewmodel.dart';
import 'pellen/repository/pellen_repo.dart';
import 'shared/services/navigation.service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton(() => HomeViewModel());

  locator.registerFactory<FringillaRepo>(() => FringillaRepoImpl());
  locator.registerFactory<PellenRepo>(() => PellenRepoImpl());
}
