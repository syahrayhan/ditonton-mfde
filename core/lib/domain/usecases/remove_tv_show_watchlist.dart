import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_show_detail.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';

class RemoveTvShowWatchlist {
  final TvShowRepository repository;

  RemoveTvShowWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvShowDetail tvShow) {
    return repository.removeTvShowWatchlist(tvShow);
  }
}
