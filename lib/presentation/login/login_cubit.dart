import 'package:demo/domain/usecase/login_use_case.dart';
import 'package:demo/presentation/login/login_state.dart';
import 'package:demo/core/validator/email_validator.dart';
import 'package:demo/core/validator/password_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void onEmailChange(String value) {
    final email = EmailValidator.dirty(value);
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
        isValid: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> login(String userName, String password) async {
    //emit(Result.loading());
    //final result = await _loginUseCase.execute(userName, password);
    //emit(result);
  }

  void onLogin() {
    final email = EmailValidator.dirty(state.email.value);
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
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    }
  }
}
