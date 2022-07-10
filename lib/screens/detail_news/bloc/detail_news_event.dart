part of 'detail_news_bloc.dart';

class DetailNewsEvent {
  const DetailNewsEvent();
}

class LoadDetailNews extends DetailNewsEvent {
  final int idnews;

  const LoadDetailNews({required this.idnews});
}
