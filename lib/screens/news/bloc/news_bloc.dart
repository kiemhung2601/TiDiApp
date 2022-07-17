import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/model/person.dart';
import 'package:socialworkapp/screens/news/bloc/news_status.dart';
import 'package:dio/dio.dart';

import '../../../model/new.dart';
import '../../../network/custom_exception.dart';
import '../../../repository/repos.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const NewsState()) {
    on<LoadNews>((event, emit) async {
      try{
        emit(state.updateWith(newsStatus: const InitNewsStatus()));
        List<News> lstNew = [];
        final result = await ApiRepository.newsRepo.getListNews();
        if (result.data['status'] == 1){

          for (int i = 0; i < result.data['data'].length; i++) {
            lstNew.add(News.fromJson(result.data['data'][i]));
          }
          emit(state.updateWith(newsStatus: NewsStatusSuccess(lstNew)));
        } else{
          emit(state.updateWith(
              newsStatus: NewsStatusFail(ResponseError(errorCode: result.data['status'].toString(), message: result.data['msg']))));
        }
      } on DioError catch(e){
        emit(state.updateWith(
            newsStatus: NewsStatusFail(
                DioExceptions.fromDioError(e).responseError)));
      }
    });
  }
}
