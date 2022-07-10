part of 'detail_news_bloc.dart';

class DetailNewsState extends Equatable {
  final DetailNewsStatus detailNewsStatus;

  const DetailNewsState({
    this.detailNewsStatus = const InitDetailNewsStatus(),
  });

  DetailNewsState updateWith({
    DetailNewsStatus? detailNewsStatus,
  }) {
    return DetailNewsState(
      detailNewsStatus: detailNewsStatus ?? this.detailNewsStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    detailNewsStatus,
  ];
}
