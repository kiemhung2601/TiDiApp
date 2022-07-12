import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/fake_data/fake_data.dart';
import 'package:socialworkapp/screens/home/bloc/home_status.dart';

import '../../../model/account.dart';
import '../../../model/new.dart';
import '../../../model/score.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadInfoHome>((event, emit) {
      emit(state.updateWith(homeStatus: const InitHomeStatus()));
      List<Score> lstSco = lstScore;
      Account account = event.account;
      for(int i = 0; i < lstSco.length ; i++){
        if(account.accountId == i){
          emit(state.updateWith(homeStatus: HomeStatusSuccess(score: lstSco[i])));
        }
      }

      emit(state.updateWith(newsHomeStatus: const InitNewsHomeStatus()));
      List<News> lstNew = [];
      for(int i = 0; i < 6 ; i++){
        if(lstNews[i].status == 0 || lstNews[i].status == 1){
          lstNew.add(lstNews[i]);
        }
      }
      emit(state.updateWith(newsHomeStatus: NewsHomeStatusSuccess(lstNews: lstNew)));
    });
  }
}
