part of 'home_bloc.dart';

class HomeEvent{
  const HomeEvent();
}

class LoadInfoHome extends HomeEvent {
  final Person person;

  const LoadInfoHome({required this.person});
}
