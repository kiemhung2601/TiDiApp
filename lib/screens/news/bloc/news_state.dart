part of 'news_bloc.dart';

class NewsState extends Equatable {
  final NewsStatus newsStatus;

  const NewsState({
    this.newsStatus = const InitNewsStatus(),
  });

  NewsState updateWith({
    NewsStatus? newsStatus,
  }) {
    return NewsState(
      newsStatus: newsStatus ?? this.newsStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    newsStatus,
  ];
}