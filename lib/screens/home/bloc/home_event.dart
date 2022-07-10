part of 'home_bloc.dart';

class HomeEvent{
  const HomeEvent();
}

class LoadInfoHome extends HomeEvent {
  final Account account;

  const LoadInfoHome({required this.account});
}
