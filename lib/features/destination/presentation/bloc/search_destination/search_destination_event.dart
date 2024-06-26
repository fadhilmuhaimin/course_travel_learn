part of 'search_destination_bloc.dart';

sealed class SearchDestinationEvent extends Equatable {
  const SearchDestinationEvent();

  @override
  List<Object> get props => [];
}

class OnSearchDestinationEvent extends SearchDestinationEvent {
  final String query;

  const OnSearchDestinationEvent(this.query);
  @override
  List<Object> get props => [query];
}