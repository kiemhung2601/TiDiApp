part of 'history_bloc.dart';

class HistoryState extends Equatable {
  final HistoryStatus historyStatus;

  const HistoryState({
    this.historyStatus = const InitHistoryStatus(),
  });

  HistoryState updateWith({
    HistoryStatus? historyStatus,
  }) {
    return HistoryState(
      historyStatus: historyStatus ?? this.historyStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    historyStatus,
  ];
}