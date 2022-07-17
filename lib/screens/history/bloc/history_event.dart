part of 'history_bloc.dart';

class HistoryEvent {
  const HistoryEvent();
}

class LoadHistory extends HistoryEvent {
  final String idAccount;
  final int? type;

  const LoadHistory({required this.idAccount, this.type});
}
