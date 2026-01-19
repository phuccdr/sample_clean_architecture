import 'package:demo/core/validator/phone_number_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class EnterPhoneNumberState extends Equatable {
  const EnterPhoneNumberState({
    this.phoneNumber = const PhoneNumberValidator.pure(),
    this.status = FormzSubmissionStatus.initial,
  });
  final PhoneNumberValidator phoneNumber;
  final FormzSubmissionStatus status;

  @override
  List<Object?> get props => [phoneNumber, status];

  EnterPhoneNumberState copyWith({
    PhoneNumberValidator? phoneNumber,
    FormzSubmissionStatus? status,
  }) {
    return EnterPhoneNumberState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
    );
  }
}
