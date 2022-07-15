import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:socialworkapp/model/person.dart';
import 'package:socialworkapp/repository/repos.dart';
import 'package:socialworkapp/screens/information/bloc/information_status.dart';


part 'information_event.dart';
part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  late Person person;
  InformationBloc() : super(const InformationState()) {
    on<LoadInformationStudent>((event, emit) {
      emit(state.updateWith(informationStatus: const InitInformationStatus()));
      person = event.person;

      emit(state.updateWith(informationStatus: InformationStatusSuccess(person)));
    });
    on<ChangeInformationStudent>((event, emit) async {
      late String address;
      late String email;
      late String phone;
      if(event.address.isNotEmpty){
        address = event.address;
      } else{
        address = person.address!;
      }
      if(event.email.isNotEmpty){
        email = event.email;
      } else{
        email = person.mail!;
      }
      if(event.phone.isNotEmpty){
        phone = event.phone;
      } else{
        phone = person.phone!;
      }
      emit(state.updateWith(updateInformationStatus: const UpdateInformationLoadingStatus()));
      final result = await ApiRepository.accountRepo.updateInforAccount(event.id, address, email, phone);

      if(result.data['status'] == 1){
        debugPrint(result.data['data']['address']);
        person.address = result.data['data']['address'];
        person.mail = result.data['data']['mail'];
        person.phone = result.data['data']['phone'];
        emit(state.updateWith(updateInformationStatus: UpdateInformationStatusSuccess(person, result.data['msg'])));
      } else{
        emit(state.updateWith(updateInformationStatus: UpdateInformationStatusFail(exception: result.data['msg'])));
      }

      emit(state.updateWith(informationStatus: InformationStatusSuccess(person)));
    });
  }
}
