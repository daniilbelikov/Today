part of 'events_bloc.dart';

abstract class EventsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateEvent extends EventsEvent {
  final EventModel event;

  CreateEvent(this.event);

  @override
  List<Object> get props => [event];
}

class GetCityEvents extends EventsEvent {
  final String city;

  GetCityEvents(this.city);

  @override
  List<Object> get props => [city];
}

class AddLikeEvent extends EventsEvent {
  final String city;
  final EventModel model;

  AddLikeEvent(this.city, this.model);

  @override
  List<Object> get props => [city];
}
