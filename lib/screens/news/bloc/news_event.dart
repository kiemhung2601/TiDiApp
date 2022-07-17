part of 'news_bloc.dart';

class NewsEvent {
  const NewsEvent();
}

class LoadNews extends NewsEvent {
  final UserApp person;

  const LoadNews({required this.person});
}
