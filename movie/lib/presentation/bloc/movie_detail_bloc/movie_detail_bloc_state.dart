part of 'movie_detail_bloc_bloc.dart';

abstract class MovieDetailBlocState extends Equatable {
  const MovieDetailBlocState();
  
  @override
  List<Object> get props => [];
}

class MovieDetailBlocInitial extends MovieDetailBlocState {}
