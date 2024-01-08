part of 'activity_bloc.dart';

@immutable
abstract class ActivityState extends Equatable {
  @override
  List<Object> get props => [];
}

class EventsLoading extends ActivityState {}

class EventsLoaded extends ActivityState {
  final List<EventModel> events;

  EventsLoaded(this.events);

  @override
  List<Object> get props => [events];
}

class EventError extends ActivityState {
  final String error;

  EventError(this.error);

  @override
  List<Object> get props => [error];
}
