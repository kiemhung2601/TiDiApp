part of 'news_bloc.dart';

class NewsEvent {
  const NewsEvent();
}

class LoadNews extends NewsEvent {
  final Account account;

  const LoadNews({required this.account});
}
