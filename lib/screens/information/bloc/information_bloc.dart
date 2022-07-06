import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/model/student.dart';
import 'package:socialworkapp/screens/information/bloc/information_status.dart';

part 'information_event.dart';
part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  Student student = Student(
    studentId: 141801773,
    studentName: 'Đặng Kiếm Hùng',
    studentClass: '18DTH5',
    studentMajor: 'Công nghệ thông tin',
    schoolYear: '2018-2022',
    address: 'Huỳnh Văn Nghệ, P.Bửu Long, TP.Biên Hòa, Đồng Nai',
    mail: 'kiemhung2601@gmail.com',
    phone: '0359882902',
    gender: 'Nam',
    dateBorn: '26/01/2000',
    urlImage: 'https://media.istockphoto.com/photos/portrait-of-happy-asian-handsome-young-man-in-fashionable-clothing-picture-id1283231614?s=612x612',
  );
  InformationBloc() : super(const InformationState()) {
    on<LoadInformationStudent>((event, emit) {
      emit(state.updateWith(informationStatus: const InitInformationStatus()));
      emit(state.updateWith(informationStatus: InformationStatusSuccess(student)));
    });
    on<ChangeInformationStudent>((event, emit) {
      emit(state.updateWith(informationStatus: const InitInformationStatus()));

      student.address = event.address;
      student.mail = event.email;
      student.phone = event.phone;

      emit(state.updateWith(informationStatus: InformationStatusSuccess(student)));
    });
  }
}
