import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/usecases/get_popular_movies.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc(this.getPopularMovies) : super(PopularMoviesListEmpty()) {
    on<PopularMoviesEvent>((event, emit) async {
      emit(PopularMoviesListLoading());
      final result = await getPopularMovies.execute();
      result.fold(
        (failure) {
          emit(PopularMoviesListError(failure.message));
        },
        (moviesData) {
          emit(PopularMoviesListLoaded(moviesData));
        },
      );
    });
  }
}
