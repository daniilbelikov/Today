import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import '../data/models/event_model.dart';
import 'package:equatable/equatable.dart';
import '../data/repository/events_repository.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final EventsRepository repository;

  EventsBloc({required this.repository}) : super(EventsLoading()) {
    /*
    on<CreateEvent>((event, emit) async {
      emit(EventAdding());
      await Future.delayed(const Duration(seconds: 1));

      try {
        await repository.createEvent(
          name: event.name,
          price: event.price,
        );
        emit(EventAdded());
      } catch (error) {
        emit(EventError(error.toString()));
      }
    });
    */
    on<GetEvents>((event, emit) async {
      emit(EventsLoading());

      try {
        final data = await repository.getEvents();
        emit(EventsLoaded(data));
      } catch (error) {
        emit(EventError(error.toString()));
      }
    });
  }
}
