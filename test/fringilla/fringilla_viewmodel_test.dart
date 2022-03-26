import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:screener/fringilla/model/fringilla.model.dart';
import 'package:screener/fringilla/view_models/fringilla.viewmodel.dart';

import 'fringilla_repo_test.mocks.dart';

Future<void> main() async {
  late MockFringillaRepoTest fringillaRepo;
  late FringillaViewModel viewModel;

  setUpAll(() {
    fringillaRepo = MockFringillaRepoTest();
    viewModel = FringillaViewModel(repo: fringillaRepo);
  });

  group('fringilla viewmodel test', () {
    test('test fetchData', () async {
      final model = FringillaModel();

      when(fringillaRepo.fetchData()).thenAnswer((_) async {
        return model;
      });

      await viewModel.fetchData();

      expect(viewModel.model, model);
    });

    test('test fetchData for repository', () async {
      final model = FringillaModel();

      when(fringillaRepo.fetchData()).thenAnswer((_) async {
        return model;
      });

      final resp = await fringillaRepo.fetchData();
      viewModel.model = resp;

      expect(viewModel.model, model);
    });
  });
}
