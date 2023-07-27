import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'popular_movies_bloc_event.dart';
part 'popular_movies_bloc_state.dart';

class PopularMoviesBlocBloc extends Bloc<PopularMoviesBlocEvent, PopularMoviesBlocState> {
  PopularMoviesBlocBloc() : super(PopularMoviesBlocInitial()) {
    on<PopularMoviesBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
