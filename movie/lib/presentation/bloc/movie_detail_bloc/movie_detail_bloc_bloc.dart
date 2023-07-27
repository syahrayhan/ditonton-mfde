import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_detail_bloc_event.dart';
part 'movie_detail_bloc_state.dart';

class MovieDetailBlocBloc
    extends Bloc<MovieDetailBlocEvent, MovieDetailBlocState> {
  MovieDetailBlocBloc() : super(MovieDetailBlocInitial()) {
    on<MovieDetailBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
