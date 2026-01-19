import 'package:demo/core/validator/password_validator.dart';
import 'package:demo/core/validator/phone_number_validator.dart';
import 'package:demo/domain/usecase/login_use_case.dart';
import 'package:demo/presentation/login/login_state.dart';
import 'package:demo/shared/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginState());
  final LoginUseCase _loginUseCase;

  void onEmailChange(String value) {
    final email = PhoneNumberValidator.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
      ),
    );
  }

  void onPasswordChange(String value) {
    final password = PasswordValidator.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.phoneNumber, password]),
      ),
    );
  }

  Future<void> onLogin() async {
    final email = PhoneNumberValidator.dirty(state.phoneNumber.value);
    final password = PasswordValidator.dirty(state.password.value);
    final isValid = Formz.validate([email, password]);
    emit(
      state.copyWith(
        email: email,
        password: password,
        isValid: isValid,
        status: FormzSubmissionStatus.initial,
      ),
    );
    if (isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await _loginUseCase.execute(email.value, password.value);
      switch (result.status) {
        case Status.Success:
          emit(state.copyWith(status: FormzSubmissionStatus.success));
        case Status.Loading:
          emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
        case Status.Failed:
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
