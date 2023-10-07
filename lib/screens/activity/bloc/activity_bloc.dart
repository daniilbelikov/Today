import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../../../models/common/event_model.dart';
import '../data/repository/activity_repository.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final ActivityRepository _repository;

  ActivityBloc({required ActivityRepository repository})
      : _repository = repository,
        super(EventsLoading()) {
    on<GetActivityEvents>((event, emit) async {
      emit(EventsLoading());

      try {
        final events = await _repository.getEvents();
        emit(EventsLoaded(events));
      } catch (error) {
        emit(EventError(error.toString()));
      }
    });
  }
}
