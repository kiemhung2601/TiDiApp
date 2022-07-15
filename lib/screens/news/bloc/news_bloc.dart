import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/model/person.dart';
import 'package:socialworkapp/screens/news/bloc/news_status.dart';

import '../../../fake_data/fake_data.dart';
import '../../../model/new.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const NewsState()) {
    on<LoadNews>((event, emit) {
      emit(state.updateWith(newsStatus: const InitNewsStatus()));
      List<News> lstNew = [];
      for(int i = 0; i < lstNews.length ; i++){
        if(lstNews[i].status == 0 || lstNews[i].status == 1){
          lstNew.add(lstNews[i]);
        }
      }
      emit(state.updateWith(newsStatus: NewsStatusSuccess(lstNew)));
    });
  }
}
