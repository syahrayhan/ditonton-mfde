import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';

class GetTvShowTopRated {
  final TvShowRepository tvShowRepository;

  GetTvShowTopRated(this.tvShowRepository);

  Future<Either<Failure, List<TvShow>>> execute() {
    return tvShowRepository.getTopRatedTvShow();
  }
}
