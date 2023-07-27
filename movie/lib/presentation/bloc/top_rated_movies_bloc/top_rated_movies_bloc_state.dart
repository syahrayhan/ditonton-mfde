part of 'top_rated_movies_bloc_bloc.dart';

abstract class TopRatedMoviesBlocState extends Equatable {
  const TopRatedMoviesBlocState();
  
  @override
  List<Object> get props => [];
}

class TopRatedMoviesBlocInitial extends TopRatedMoviesBlocState {}
