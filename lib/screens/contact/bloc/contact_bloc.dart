import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/repository/repos.dart';
import 'package:socialworkapp/screens/contact/bloc/contact_status.dart';
import 'package:dio/dio.dart';

import '../../../model/contact.dart';
import '../../../network/custom_exception.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const ContactState()) {
    on<LoadInforContact>((event, emit) async {
      try {
        emit(state.updateWith(contactStatus: const InitContactStatus()));
        final result = await ApiRepository.contactRepo.getInfoContact();
        if (result.data['status'] == 1) {
          Contact contact = Contact.fromJson(result.data['data']);
          emit(state.updateWith(contactStatus: ContactStatusSuccess(contact)));
        } else {
          emit(state.updateWith(
              contactStatus: ContactStatusFail(ResponseError(
                  errorCode: result.data['status'].toString(),
                  message: result.data['msg']))));
        }
      } on DioError catch (e) {
        emit(state.updateWith(
            contactStatus: ContactStatusFail(
                DioExceptions.fromDioError(e).responseError)));
      }
    });
  }
}
