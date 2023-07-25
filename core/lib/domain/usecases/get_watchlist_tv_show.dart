import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';

class GetWatchlistTvShow {
  final TvShowRepository _repository;

  GetWatchlistTvShow(this._repository);

  Future<Either<Failure, List<TvShow>>> execute() {
    return _repository.getTvShowWatchlist();
  }
}
