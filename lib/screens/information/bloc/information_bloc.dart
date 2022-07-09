import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/model/student.dart';
import 'package:socialworkapp/screens/information/bloc/information_status.dart';

part 'information_event.dart';
part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  Person person = Person(
    studentId: 141801773,
    name: 'Đặng Kiếm Hùng',
    studentClass: '18DTH5',
    studentMajor: 'Công nghệ thông tin',
    schoolYear: '2018-2022',
    address: 'Huỳnh Văn Nghệ, P.Bửu Long, TP.Biên Hòa, Đồng Nai',
    mail: 'kiemhung2601@gmail.com',
    phone: '0359882902',
    gender: 'Nam',
    dateBorn: '26/01/2000',
    urlImage: 'https://i.pinimg.com/564x/ba/58/83/ba5883c68a1ffef7d29971eaa7686133.jpg',
  );
  InformationBloc() : super(const InformationState()) {
    on<LoadInformationStudent>((event, emit) {
      emit(state.updateWith(informationStatus: const InitInformationStatus()));
      emit(state.updateWith(informationStatus: InformationStatusSuccess(person)));
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
