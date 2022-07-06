part of 'information_bloc.dart';

abstract class InformationEvent {
  const InformationEvent();
}

class LoadInformationStudent extends InformationEvent {
  // final int productId;

  const LoadInformationStudent();
}

class ChangeInformationStudent extends InformationEvent {
  final String address;
  final String email;
  final String phone;

  const ChangeInformationStudent({required this.address, required this.email, required this.phone});
}