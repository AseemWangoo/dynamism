import 'package:get_it/get_it.dart';

import 'home/view_models/home.viewmodel.dart';
import 'shared/services/navigation.service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton(() => HomeViewModel());
}
