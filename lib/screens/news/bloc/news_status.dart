
import 'package:socialworkapp/model/new.dart';

import '../../../network/custom_exception.dart';

abstract class NewsStatus {
  const NewsStatus();
}

class InitNewsStatus extends NewsStatus {
  const InitNewsStatus();
}

class NewsStatusFail extends NewsStatus {
  final ResponseError responseError;

  NewsStatusFail(this.responseError);
}

class NewsStatusSuccess extends NewsStatus {
  final List<News> lstNews;

  NewsStatusSuccess(this.lstNews,);

  // TODO: implement props
  List<Object?> get props => [lstNews];
}