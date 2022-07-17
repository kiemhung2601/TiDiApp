import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/fake_data/fake_data.dart';
import 'package:socialworkapp/repository/repos.dart';
import 'package:socialworkapp/screens/detail_news/bloc/detail_news_status.dart';
import 'package:dio/dio.dart';

import '../../../model/new.dart';
import '../../../network/custom_exception.dart';

part 'detail_news_event.dart';
part 'detail_news_state.dart';

class DetailNewsBloc extends Bloc<DetailNewsEvent, DetailNewsState> {
  DetailNewsBloc() : super(const DetailNewsState()) {
    on<LoadDetailNews>((event, emit) {
      if (state.changeStatusNewsStatus is ChangeStatusNewsStatusSuccess ||
          state.changeStatusNewsStatus is ChangeStatusNewsStatusFail) {
        emit(state.updateWith(
            changeStatusNewsStatus: const InitChangeStatusNewsStatus()));
      }
      emit(state.updateWith(detailNewsStatus: const InitDetailNewsStatus()));

      late News news;
      for (int i = 0; i < lstNews.length; i++) {
        if (event.idnews == lstNews[i].idNews) {
          news = lstNews[i];
        }
      }

      emit(state.updateWith(detailNewsStatus: DetailNewsStatusSuccess(news)));
    });
    on<ChangeTypeNewsEvent>((event, emit) async {
      try {
        emit(state.updateWith(
            changeStatusNewsStatus: const ChangeStatusNewsLoadingStatus()));

        //0. đăng ký     1. hũy đăng ký
        if (event.typeChange == 0) {
          final result = await ApiRepository.newsRepo
              .registerNews(event.idnews, event.idAccount);

          if (result.data['status'] == 1) {
            emit(state.updateWith(
                changeStatusNewsStatus: const ChangeStatusNewsStatusSuccess()));
          } else {
            emit(state.updateWith(
                changeStatusNewsStatus: ChangeStatusNewsStatusFail(
                    ResponseError(
                        errorCode: result.data['status'].toString(),
                        message: result.data['msg']))));
          }
        }
        if(event.typeChange == 1){
          final result = await ApiRepository.newsRepo
              .unRegisterNews(event.idnews, event.idAccount);

          if (result.data['status'] == 1) {
            emit(state.updateWith(
                changeStatusNewsStatus: const ChangeStatusNewsStatusSuccess()));
          } else {
            emit(state.updateWith(
                changeStatusNewsStatus: ChangeStatusNewsStatusFail(
                    ResponseError(
                        errorCode: result.data['status'].toString(),
                        message: result.data['msg']))));
          }
        }
      } on DioError catch (e) {
        emit(state.updateWith(
            changeStatusNewsStatus: ChangeStatusNewsStatusFail(
                DioExceptions.fromDioError(e).responseError)));
      }
    });
  }
}
