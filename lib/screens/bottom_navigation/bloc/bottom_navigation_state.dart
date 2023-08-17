part of 'bottom_navigation_bloc.dart';

@immutable
abstract class BottomNavigationState {
  final int tabIndex;

  const BottomNavigationState({required this.tabIndex});
}

class InitialState extends BottomNavigationState {
  const InitialState({required super.tabIndex});
}
