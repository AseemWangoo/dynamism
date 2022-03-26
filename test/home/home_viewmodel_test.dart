import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:screener/home/model/carousel.model.dart';
import 'package:screener/home/view_models/home.viewmodel.dart';

import 'home_repo_test.mocks.dart';

Future<void> main() async {
  late MockHomeRepoTest homeRepo;
  late HomeViewModel viewModel;

  setUpAll(() {
    homeRepo = MockHomeRepoTest();
    viewModel = HomeViewModel(repo: homeRepo);
  });

  group('home viewmodel test', () {
    test('test fetchData', () async {
      final model = CarouselModel();

      when(homeRepo.fetchData()).thenAnswer((_) async {
        return model;
      });

      await viewModel.fetchData();

      expect(viewModel.homeModel, model);
    });

    test('test fetchData for repository', () async {
      final model = CarouselModel();

      when(homeRepo.fetchData()).thenAnswer((_) async {
        return model;
      });

      final resp = await homeRepo.fetchData();
      viewModel.homeModel = resp;

      expect(viewModel.homeModel, model);
    });
  });
}
