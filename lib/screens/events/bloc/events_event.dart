part of 'events_bloc.dart';

abstract class EventsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateEvent extends EventsEvent {
  final EventModel model;

  CreateEvent(this.model);

  @override
  List<Object> get props => [model];
}

class GetEvents extends EventsEvent {}
