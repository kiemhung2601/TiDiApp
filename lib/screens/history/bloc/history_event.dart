part of 'history_bloc.dart';

class HistoryEvent {
  const HistoryEvent();
}

class LoadHistory extends HistoryEvent {
  final UserApp person;
  final int? type;

  const LoadHistory({required this.person, this.type});
}
