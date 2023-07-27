import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_movies_bloc_event.dart';
part 'top_rated_movies_bloc_state.dart';

class TopRatedMoviesBlocBloc extends Bloc<TopRatedMoviesBlocEvent, TopRatedMoviesBlocState> {
  TopRatedMoviesBlocBloc() : super(TopRatedMoviesBlocInitial()) {
    on<TopRatedMoviesBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
