part of 'detail_news_bloc.dart';

class DetailNewsEvent {
  const DetailNewsEvent();
}

class LoadDetailNews extends DetailNewsEvent {
  final String idNews;
  final String idAccount;

  const LoadDetailNews({required this.idNews, required this.idAccount});
}

class ChangeTypeNewsEvent extends DetailNewsEvent {
  final String idnews;
  final String idAccount;
  final int typeChange;

  const ChangeTypeNewsEvent({required this.idnews, required this.idAccount, required this.typeChange});
}
