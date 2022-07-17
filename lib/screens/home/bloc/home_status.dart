import '../../../model/new.dart';
import '../../../model/person.dart';
import '../../../network/custom_exception.dart';

abstract class HomeStatus {
  const HomeStatus();
}

class InitHomeStatus extends HomeStatus {
  const InitHomeStatus();
}

class HomeStatusFail extends HomeStatus {
  final ResponseError responseError;

  HomeStatusFail(this.responseError);
}

class HomeStatusSuccess extends HomeStatus {
  final UserApp person;
  HomeStatusSuccess({required this.person});

  // TODO: implement props
  List<Object?> get props => [];
}

abstract class NewsHomeStatus {
  const NewsHomeStatus();
}

class InitNewsHomeStatus extends NewsHomeStatus {
  const InitNewsHomeStatus();
}

class NewsHomeStatusFail extends NewsHomeStatus {
  final ResponseError responseError;

  NewsHomeStatusFail(this.responseError);
}

class NewsHomeStatusSuccess extends NewsHomeStatus {
  final List<News> lstNews;
  NewsHomeStatusSuccess({required this.lstNews});

  // TODO: implement props
  List<Object?> get props => [lstNews];
}