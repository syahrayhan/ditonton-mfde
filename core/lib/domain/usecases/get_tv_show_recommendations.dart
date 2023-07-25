import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';

class GetTvShowRecommendations {
  final TvShowRepository tvShowRepository;

  GetTvShowRecommendations(this.tvShowRepository);

  Future<Either<Failure, List<TvShow>>> execute(int id) {
    return tvShowRepository.getTvShowRecomendation(id);
  }
}
