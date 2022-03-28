import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:screener/fringilla/model/fringilla.model.dart';
import 'package:screener/fringilla/repository/fringilla_repo.dart';

import 'fringilla_repo_test.mocks.dart';

class FringillaRepoTest extends Mock implements FringillaRepo {}

@GenerateMocks([FringillaRepoTest])
Future<void> main() async {
  late MockFringillaRepoTest fringillaRepo;

  setUpAll(() {
    fringillaRepo = MockFringillaRepoTest();
  });

  group('fringilla repo test', () {
    test('test fetchData', () async {
      final model = FringillaModel();

      when(fringillaRepo.fetchData()).thenAnswer((_) async {
        return model;
      });

      final res = await fringillaRepo.fetchData();

      expect(res, isA<FringillaModel>());
      expect(res, model);
    });

    test('test fetchData throws Exception', () {
      when(fringillaRepo.fetchData()).thenAnswer((_) async {
        throw Exception();
      });

      final res = fringillaRepo.fetchData();

      expect(res, throwsException);
    });
  });
}
