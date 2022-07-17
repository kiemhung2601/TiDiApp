import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/repository/repos.dart';
import 'package:socialworkapp/screens/home/bloc/home_status.dart';
import 'package:dio/dio.dart';

import '../../../model/new.dart';
import '../../../model/person.dart';
import '../../../network/custom_exception.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadInfoHome>((event, emit) async {
      try{
        emit(state.updateWith(homeStatus: const InitHomeStatus()));
        emit(state.updateWith(newsHomeStatus: const InitNewsHomeStatus()));

        UserApp person = event.person;

        List<News> lstNew = [];
        final result = await ApiRepository.newsRepo.getFourNews();

        if (result.data['status'] == 1){
          for (int i = 0; i < result.data['data'].length; i++) {
            lstNew.add(News.fromJson(result.data['data'][i]));
          }
          emit(state.updateWith(homeStatus: HomeStatusSuccess(person: person)));
          emit(state.updateWith(
              newsHomeStatus: NewsHomeStatusSuccess(lstNews: lstNew)));
        } else{
          emit(state.updateWith(
              newsHomeStatus: NewsHomeStatusFail(ResponseError(errorCode: result.data['status'].toString(), message: result.data['msg']))));
        }
      } on DioError catch(e){
        if (state.homeStatus is InitHomeStatus) {
          emit(state.updateWith(
              homeStatus: HomeStatusFail(
                  DioExceptions.fromDioError(e).responseError)));
        }
        if (state.newsHomeStatus is InitNewsHomeStatus) {
          emit(state.updateWith(
              newsHomeStatus: NewsHomeStatusFail(
                  DioExceptions.fromDioError(e).responseError)));
        }
      }
    });
  }
}
