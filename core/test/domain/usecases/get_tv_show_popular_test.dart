import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/usecases/get_tv_show_popular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvShowPopular usecase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    usecase = GetTvShowPopular(mockTvShowRepository);
  });

  final tMovies = <TvShow>[];

  group('GetTvShowPopular Tests', () {
    group('execute', () {
      test(
          'should get list of tv show from the repository when execute function is called',
          () async {
        // arrange
        when(mockTvShowRepository.getPopularTvShow())
            .thenAnswer((_) async => Right(tMovies));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tMovies));
      });
    });
  });
}
