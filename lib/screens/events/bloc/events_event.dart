part of 'events_bloc.dart';

abstract class EventsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
class CreateEvent extends EventsEvent {
  final String name;
  final String price;

  CreateEvent(this.name, this.price);
}
*/
class GetEvents extends EventsEvent {}
