part of 'information_bloc.dart';

abstract class InformationEvent {
  const InformationEvent();
}

class LoadInformationStudent extends InformationEvent {
  final Person person;

  const LoadInformationStudent({required this.person});
}

class ChangeInformationStudent extends InformationEvent {
  final String id;
  final String address;
  final String email;
  final String phone;

  const ChangeInformationStudent({required this.id, required this.address, required this.email, required this.phone});
}