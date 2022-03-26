import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:screener/home/model/carousel.model.dart';
import 'package:screener/home/repository/home_repo.dart';

import 'home_repo_test.mocks.dart';

class HomeRepoTest extends Mock implements HomeRepo {}

@GenerateMocks([HomeRepoTest])
Future<void> main() async {
  late MockHomeRepoTest homeRepo;

  setUpAll(() {
    homeRepo = MockHomeRepoTest();
  });

  group('home repo test', () {
    test('test fetchData', () async {
      final model = CarouselModel();

      when(homeRepo.fetchData()).thenAnswer((_) async {
        return model;
      });

      final res = await homeRepo.fetchData();

      expect(res, isA<CarouselModel>());
      expect(res, model);
    });

    test('test fetchData throws Exception', () {
      when(homeRepo.fetchData()).thenAnswer((_) async {
        throw Exception();
      });

      final res = homeRepo.fetchData();

      expect(res, throwsException);
    });
  });
}
