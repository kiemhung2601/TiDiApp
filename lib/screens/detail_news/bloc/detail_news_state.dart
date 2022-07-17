part of 'detail_news_bloc.dart';

class DetailNewsState extends Equatable {
  final DetailNewsStatus detailNewsStatus;
  final ChangeStatusNewsStatus changeStatusNewsStatus;

  const DetailNewsState({
    this.detailNewsStatus = const InitDetailNewsStatus(),
    this.changeStatusNewsStatus = const InitChangeStatusNewsStatus(),
  });

  DetailNewsState updateWith({
    DetailNewsStatus? detailNewsStatus,
    ChangeStatusNewsStatus? changeStatusNewsStatus
  }) {
    return DetailNewsState(
      detailNewsStatus: detailNewsStatus ?? this.detailNewsStatus,
        changeStatusNewsStatus: changeStatusNewsStatus ?? this.changeStatusNewsStatus
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    detailNewsStatus,
    changeStatusNewsStatus
  ];
}
