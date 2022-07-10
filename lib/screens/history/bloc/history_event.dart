part of 'history_bloc.dart';

class HistoryEvent {
  const HistoryEvent();
}

class LoadHistory extends HistoryEvent {
  final Account account;
  final int? type;

  const LoadHistory({required this.account, this.type});
}
