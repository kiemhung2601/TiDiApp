import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/screens/home_main/bloc/home_main_status.dart';

import '../../../fake_data/fake_data.dart';
import '../../../model/account.dart';
import '../../../model/person.dart';

part 'home_main_event.dart';
part 'home_main_state.dart';

class HomeMainBloc extends Bloc<HomeMainEvent, HomeMainState> {
  HomeMainBloc() : super(const HomeMainState()) {
    on<LoadHomeMain>((event, emit) {
      emit(state.updateWith(homeMainStatus: const InitHomeMainStatus()));
      List<Person> lstPer = lstPerson;
      Account account = event.account;
      for(int i = 0; i < lstPer.length; i++){
        if(account.accountId == i){
          emit(state.updateWith(homeMainStatus: HomeMainStatusSuccess(lstPer[i])));
        }
      }
    });
  }
}
