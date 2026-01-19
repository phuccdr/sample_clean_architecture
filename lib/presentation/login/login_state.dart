import 'package:demo/core/validator/password_validator.dart';
import 'package:demo/core/validator/phone_number_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  const LoginState({
    this.phoneNumber = const PhoneNumberValidator.pure(),
    this.isValid = false,
    this.password = const PasswordValidator.pure(),
    this.status = FormzSubmissionStatus.initial,
  });
  final PhoneNumberValidator phoneNumber;
  final bool isValid;
  final PasswordValidator password;
  final FormzSubmissionStatus status;

  @override
  List<Object?> get props => [phoneNumber, isValid, password, status];

  LoginState copyWith({
    PhoneNumberValidator? email,
    bool? isValid,
    PasswordValidator? password,
    FormzSubmissionStatus? status,
  }) {
    return LoginState(
      phoneNumber: email ?? phoneNumber,
      isValid: isValid ?? this.isValid,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
