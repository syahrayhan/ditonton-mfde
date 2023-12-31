import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

import 'package:core/domain/usecases/get_watchlist_movies.dart';
import 'package:core/domain/usecases/get_watchlist_tv_show.dart';
import 'package:core/presentation/provider/watchlist_movie_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/test/dummy_data/dummy_objects.dart';
import 'watchlist_movie_notifier_test.mocks.dart';

@GenerateMocks([GetWatchlistMovies, GetWatchlistTvShow])
void main() {
  late WatchlistMovieNotifier provider;
  late MockGetWatchlistMovies mockGetWatchlistMovies;
  late MockGetWatchlistTvShow mockGetWatchlistTvShow;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    mockGetWatchlistTvShow = MockGetWatchlistTvShow();
    provider = WatchlistMovieNotifier(
      getWatchlistMovies: mockGetWatchlistMovies,
      getWatchlistTvShow: mockGetWatchlistTvShow,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  group('tv show watchlist', () {
    test('should change tv show data when data is gotten successfully',
        () async {
      when(mockGetWatchlistTvShow.execute())
          .thenAnswer((_) async => Right([testWatchlistTvShow]));

      await provider.fetchWatchlistTvShow();

      expect(provider.watchlistTvShowState, RequestState.Loaded);
      expect(provider.watchListTvShow, [testWatchlistTvShow]);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetWatchlistTvShow.execute())
          .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
      // act
      await provider.fetchWatchlistTvShow();
      // assert
      expect(provider.watchlistTvShowState, RequestState.Error);
      expect(provider.message, "Can't get data");
      expect(listenerCallCount, 2);
    });
  });

  group('movie watchlist', () {
    test('should change movies data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Right([testWatchlistMovie]));
      // act
      await provider.fetchWatchlistMovies();
      // assert
      expect(provider.watchlistState, RequestState.Loaded);
      expect(provider.watchlistMovies, [testWatchlistMovie]);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
      // act
      await provider.fetchWatchlistMovies();
      // assert
      expect(provider.watchlistState, RequestState.Error);
      expect(provider.message, "Can't get data");
      expect(listenerCallCount, 2);
    });
  });
}
