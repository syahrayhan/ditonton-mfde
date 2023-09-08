import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/usecases/get_top_rated_movies.dart';
import 'package:movie/presentation/bloc/top_rated_movies_bloc/top_rated_movies_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import 'top_rated_movies_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late TopRatedMoviesBloc bloc;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    bloc = TopRatedMoviesBloc(mockGetTopRatedMovies);
  });

  blocTest<TopRatedMoviesBloc, TopRatedMoviesState>(
    'should change state to loading when usecase is called',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right([testMovie]));
      return bloc;
    },
    act: (bloc) => bloc.add(const TopRatedMoviesEvent()),
    expect: () => [
      TopRatedMoviesLoading(),
      TopRatedMoviesLoaded([testMovie]),
    ],
  );

  blocTest<TopRatedMoviesBloc, TopRatedMoviesState>(
    'should return error when data is unsuccessful',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return bloc;
    },
    act: (bloc) => bloc.add(const TopRatedMoviesEvent()),
    expect: () => [
      TopRatedMoviesLoading(),
      const TopRatedMoviesError('Server Failure'),
    ],
  );
}
