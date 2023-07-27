part of 'popular_movies_bloc_bloc.dart';

abstract class PopularMoviesBlocState extends Equatable {
  const PopularMoviesBlocState();
  
  @override
  List<Object> get props => [];
}

class PopularMoviesBlocInitial extends PopularMoviesBlocState {}
