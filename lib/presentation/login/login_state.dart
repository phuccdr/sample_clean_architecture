import 'package:demo/core/validator/email_validator.dart';
import 'package:demo/core/validator/password_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const EmailValidator.pure(),
    this.isValid = false,
    this.password = const PasswordValidator.pure(),
    this.status = FormzSubmissionStatus.initial,
  });
  final EmailValidator email;
  final bool isValid;
  final PasswordValidator password;
  final FormzSubmissionStatus status;

  @override
  List<Object?> get props => [email, isValid, password, status];

  LoginState copyWith({
    EmailValidator? email,
    bool? isValid,
    PasswordValidator? password,
    FormzSubmissionStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
