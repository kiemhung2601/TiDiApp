part of 'contact_bloc.dart';


class ContactState extends Equatable {
  final ContactStatus contactStatus;

  const ContactState({
    this.contactStatus = const InitContactStatus(),
  });

  ContactState updateWith({
    ContactStatus? contactStatus,
  }) {
    return ContactState(
      contactStatus: contactStatus ?? this.contactStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    contactStatus,
  ];
}
