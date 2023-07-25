import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';

class SearchTvShow {
  final TvShowRepository tvShowRepository;

  SearchTvShow(this.tvShowRepository);

  Future<Either<Failure, List<TvShow>>> execute(String query) {
    return tvShowRepository.searchTvShow(query);
  }
}
