part of 'search_tv_bloc.dart';

abstract class SearchTvState extends Equatable {
  const SearchTvState();

  @override
  List<Object> get props => [];
}

class SearchEmpty extends SearchTvState {}

class SearchLoading extends SearchTvState {}

class SearchError extends SearchTvState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchHasData extends SearchTvState {
  final List<TvShow> result;

  const SearchHasData(this.result);

  @override
  List<Object> get props => [result];
}
