
import '../../../model/contact.dart';
import '../../../network/custom_exception.dart';

abstract class ContactStatus {
  const ContactStatus();
}

class InitContactStatus extends ContactStatus {
  const InitContactStatus();
}

class ContactStatusFail extends ContactStatus {
  final ResponseError responseError;

  ContactStatusFail(this.responseError);
}

class ContactStatusSuccess extends ContactStatus {
  final Contact contact;

  ContactStatusSuccess(this.contact,);

  // TODO: implement props
  List<Object?> get props => [contact];
}