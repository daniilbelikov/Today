import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:today/screens/events/data/repository/events_repository.dart';
import 'package:today/models/common/event_model.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final EventsRepository _repository;

  EventsBloc({required EventsRepository repository})
      : _repository = repository,
        super(EventsLoading()) {
    on<CreateEvent>((event, emit) async {
      emit(EventAdding());

      try {
        await _repository.createEvent(event.event);
        emit(EventAdded());
      } catch (error) {
        emit(EventError(error.toString()));
      }
    });

    on<GetCityEvents>((event, emit) async {
      emit(EventsLoading());

      try {
        final events = await _repository.getCityEvents(event.city);
        emit(EventsLoaded(events));
      } catch (error) {
        emit(EventError(error.toString()));
      }
    });

    on<AddLikeEvent>((event, emit) async {
      emit(EventsLoading());

      try {
        await _repository.addLikeEvent(event.model).whenComplete(() async {
          final events = await _repository.getCityEvents(event.city);
          emit(EventsLoaded(events));
        });
      } catch (error) {
        emit(EventError(error.toString()));
      }
    });
  }
}
