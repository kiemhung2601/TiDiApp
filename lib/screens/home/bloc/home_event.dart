part of 'home_bloc.dart';

class HomeEvent{
  const HomeEvent();
}

class LoadInfoHome extends HomeEvent {
  final UserApp person;

  const LoadInfoHome({required this.person});
}
