import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/fake_data/fake_data.dart';
import 'package:socialworkapp/screens/detail_news/bloc/detail_news_status.dart';

import '../../../model/new.dart';

part 'detail_news_event.dart';
part 'detail_news_state.dart';

class DetailNewsBloc extends Bloc<DetailNewsEvent, DetailNewsState> {
  DetailNewsBloc() : super(const DetailNewsState()) {
    on<LoadDetailNews>((event, emit) {
      emit(state.updateWith(detailNewsStatus: const InitDetailNewsStatus()));

      late News news;
      for(int i = 0; i<lstNews.length; i++){
        if(event.idnews == lstNews[i].idNews){
          news = lstNews[i];
        }
      }

      emit(state.updateWith(detailNewsStatus: DetailNewsStatusSuccess(news)));
    });
  }
}
