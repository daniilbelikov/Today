import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const InitialState(tabIndex: 0)) {
    on<BottomNavigationEvent>((event, emit) {
      if (event is TabChangeEvent) {
        emit(InitialState(tabIndex: event.tabIndex));
      }
    });
  }
}
