part of 'home_main_bloc.dart';

class HomeMainEvent {
  const HomeMainEvent();
}

class LoadHomeMain extends HomeMainEvent {
  final Account account;

  const LoadHomeMain({required this.account});
}
