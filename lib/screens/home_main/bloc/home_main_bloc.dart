import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/screens/home_main/bloc/home_main_status.dart';

import '../../../model/person.dart';

part 'home_main_event.dart';
part 'home_main_state.dart';

class HomeMainBloc extends Bloc<HomeMainEvent, HomeMainState> {
  HomeMainBloc() : super(const HomeMainState()) {
    on<LoadHomeMain>((event, emit) {
      emit(state.updateWith(homeMainStatus: const InitHomeMainStatus()));
      Person person = event.person;
      emit(state.updateWith(homeMainStatus: HomeMainStatusSuccess(person)));
    });
  }
}
