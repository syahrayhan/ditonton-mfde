import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/transformers.dart';
import 'package:search/domain/usecases/search_tv_show.dart';

part 'search_tv_event.dart';
part 'search_tv_state.dart';

class SearchTvBloc extends Bloc<SearchTvEvent, SearchTvState> {
  final SearchTvShow _searchTvShow;

  SearchTvBloc(this._searchTvShow) : super(SearchEmpty()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;

      emit(SearchLoading());
      final result = await _searchTvShow.execute(query);

      result.fold((failure) {
        emit(SearchError(failure.message));
      }, (data) {
        emit(SearchHasData(data));
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
