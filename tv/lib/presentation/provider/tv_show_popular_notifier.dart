import 'package:core/domain/entities/tv_show.dart';
import 'package:tv/domain/usecases/get_tv_show_popular.dart';
import 'package:flutter/cupertino.dart';
import 'package:core/core.dart';

class TvShowPopularNotifier extends ChangeNotifier {
  var _popularTvShows = <TvShow>[];
  List<TvShow> get popularTvShows => _popularTvShows;

  RequestState _popularTvShowsState = RequestState.Empty;
  RequestState get popularTvShowsState => _popularTvShowsState;

  String _message = '';
  String get message => _message;

  TvShowPopularNotifier({
    required this.getTvShowPopular,
  });

  final GetTvShowPopular getTvShowPopular;

  Future<void> fetchPopularTvShows() async {
    _popularTvShowsState = RequestState.Loading;
    notifyListeners();

    final result = await getTvShowPopular.execute();
    result.fold(
      (failure) {
        _popularTvShowsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvShowsData) {
        _popularTvShowsState = RequestState.Loaded;
        _popularTvShows = tvShowsData;
        notifyListeners();
      },
    );
  }
}
