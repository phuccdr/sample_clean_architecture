import 'package:demo/core/validator/confirm_password_validator.dart';
import 'package:demo/core/validator/password_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class CreatePasswordState extends Equatable {
  const CreatePasswordState({
    this.password = const PasswordValidator.pure(),
    this.confirmPassword = const ConfirmPasswordValidator.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final PasswordValidator password;
  final ConfirmPasswordValidator confirmPassword;
  final FormzSubmissionStatus status;

  @override
  List<Object?> get props => [password, confirmPassword, status];

  CreatePasswordState copyWith({
    PasswordValidator? password,
    ConfirmPasswordValidator? confirmPassword,
    FormzSubmissionStatus? status,
  }) {
    return CreatePasswordState(
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
    );
  }
}
