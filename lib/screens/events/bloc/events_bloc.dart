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
    on<CreateEvent>((event, emit) async {
      emit(EventAdding());

      try {
        await repository.createEvent(event.model);
        emit(EventAdded());
      } catch (error) {
        emit(EventError(error.toString()));
      }
    });

    on<GetEvents>((event, emit) async {
      emit(EventsLoading());

      try {
        final events = await repository.getAllEvents();
        emit(EventsLoaded(events));
      } catch (error) {
        emit(EventError(error.toString()));
      }
    });
  }
}
