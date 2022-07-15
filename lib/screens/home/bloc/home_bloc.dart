import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/fake_data/fake_data.dart';
import 'package:socialworkapp/screens/home/bloc/home_status.dart';

import '../../../model/new.dart';
import '../../../model/person.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadInfoHome>((event, emit) {
      emit(state.updateWith(homeStatus: const InitHomeStatus()));
      Person person = event.person;

      emit(state.updateWith(homeStatus: HomeStatusSuccess(person: person)));

      emit(state.updateWith(newsHomeStatus: const InitNewsHomeStatus()));
      List<News> lstNew = [];
      for (int i = 0; i < 6; i++) {
        if (lstNews[i].status == 0 || lstNews[i].status == 1) {
          lstNew.add(lstNews[i]);
        }
      }
      emit(state.updateWith(
          newsHomeStatus: NewsHomeStatusSuccess(lstNews: lstNew)));
    });
  }
}
