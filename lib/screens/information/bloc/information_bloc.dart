import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/fake_data/fake_data.dart';
import 'package:socialworkapp/model/person.dart';
import 'package:socialworkapp/screens/information/bloc/information_status.dart';

import '../../../model/account.dart';

part 'information_event.dart';
part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  late Person person;
  InformationBloc() : super(const InformationState()) {
    on<LoadInformationStudent>((event, emit) {
      emit(state.updateWith(informationStatus: const InitInformationStatus()));
      List<Person> lstPer = lstPerson;
      Account account = event.account;
      for(int i = 0; i < lstPer.length; i++){
        if(account.accountId == i){
          emit(state.updateWith(informationStatus: InformationStatusSuccess(lstPer[i])));
        }
      }
    });
    on<ChangeInformationStudent>((event, emit) {
      emit(state.updateWith(informationStatus: const InitInformationStatus()));

      person.address = event.address;
      person.mail = event.email;
      person.phone = event.phone;

      emit(state.updateWith(informationStatus: InformationStatusSuccess(person)));
    });
  }
}
