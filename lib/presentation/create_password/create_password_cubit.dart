import 'package:demo/core/validator/confirm_password_validator.dart';
import 'package:demo/core/validator/password_validator.dart';
import 'package:demo/presentation/create_password/create_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  CreatePasswordCubit() : super(const CreatePasswordState());

  void onPasswordChange(String value) {
    final password = PasswordValidator.dirty(value);
    // Re-validate confirm password when password changes

    final confirmPassword = state.confirmPassword.value.isEmpty
        ? null
        : ConfirmPasswordValidator.dirty(
            password: value,
            value: state.confirmPassword.value,
          );
    emit(state.copyWith(password: password, confirmPassword: confirmPassword));
  }

  void onConfirmPasswordChange(String value) {
    final confirmPassword = ConfirmPasswordValidator.dirty(
      password: state.password.value,
      value: value,
    );
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  Future<void> onSubmit() async {
    if (!state.confirmPassword.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
