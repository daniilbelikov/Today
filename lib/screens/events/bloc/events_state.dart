part of 'events_bloc.dart';

@immutable
abstract class EventsState extends Equatable {
  @override
  List<Object> get props => [];
}

class EventAdding extends EventsState {}

class EventAdded extends EventsState {}

class EventsLoading extends EventsState {}

class EventsLoaded extends EventsState {
  final List<EventModel> events;

  EventsLoaded(this.events);

  @override
  List<Object> get props => [events];
}

class EventError extends EventsState {
  final String error;

  EventError(this.error);

  @override
  List<Object> get props => [error];
}
