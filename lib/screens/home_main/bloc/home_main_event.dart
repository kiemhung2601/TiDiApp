part of 'home_main_bloc.dart';

class HomeMainEvent {
  const HomeMainEvent();
}

class LoadHomeMain extends HomeMainEvent {
  final UserApp person;

  const LoadHomeMain({required this.person});
}
