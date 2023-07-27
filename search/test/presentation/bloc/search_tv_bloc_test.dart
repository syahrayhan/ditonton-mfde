import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/domain/usecases/search_tv_show.dart';
import 'package:search/presentation/bloc/search_tv/search_tv_bloc.dart';

import 'search_tv_bloc_test.mocks.dart';

@GenerateMocks([SearchTvShow])
void main() {
  late SearchTvBloc searchBloc;
  late MockSearchTvShow mockSearchTvShow;

  setUp(() {
    mockSearchTvShow = MockSearchTvShow();
    searchBloc = SearchTvBloc(mockSearchTvShow);
  });

  test('initial state should be empty', () {
    expect(searchBloc.state, SearchEmpty());
  });

  final testTvShow = TvShow(
    originalName: "ori name",
    originalLanguage: "us",
    originCountry: const ["CU"],
    name: 'name',
    firstAirDate: '2002-05-01',
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: const [14, 28],
    id: 557,
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    voteAverage: 7.2,
    voteCount: 13507,
  );

  final testTvShowList = [testTvShow];

  const tQuery = 'spiderman';

  blocTest<SearchTvBloc, SearchTvState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchTvShow.execute(tQuery))
          .thenAnswer((_) async => Right(testTvShowList));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChanged(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchLoading(),
      SearchHasData(testTvShowList),
    ],
  );

  blocTest<SearchTvBloc, SearchTvState>(
    'Should emit [Loading, Error] when get data is unsuccessful',
    build: () {
      when(mockSearchTvShow.execute(tQuery))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChanged(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchLoading(),
      const SearchError('Server Failure'),
    ],
  );
}
