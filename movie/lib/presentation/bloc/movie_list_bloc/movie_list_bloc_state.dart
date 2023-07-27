part of 'movie_list_bloc_bloc.dart';

abstract class MovieListBlocState extends Equatable {
  const MovieListBlocState();

  @override
  List<Object> get props => [];
}

// empty
class MovieListEmpty extends MovieListBlocState {}

// loading

class MovieListLoading extends MovieListBlocState {}

// loaded

class MovieListLoaded extends MovieListBlocState {
  final List<Movie> movies;

  const MovieListLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

// error

class MovieListError extends MovieListBlocState {
  final String message;

  const MovieListError(this.message);

  @override
  List<Object> get props => [message];
}
