part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesListEmpty extends PopularMoviesState {}

class PopularMoviesListLoading extends PopularMoviesState {}

class PopularMoviesListLoaded extends PopularMoviesState {
  final List<Movie> movies;

  const PopularMoviesListLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class PopularMoviesListError extends PopularMoviesState {
  final String message;

  const PopularMoviesListError(this.message);

  @override
  List<Object> get props => [message];
}
