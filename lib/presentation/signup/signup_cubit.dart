import 'package:demo/core/validator/confirm_password_validator.dart';
import 'package:demo/core/validator/name_validator.dart';
import 'package:demo/core/validator/password_validator.dart';
import 'package:demo/core/validator/phone_number_validator.dart';
import 'package:demo/presentation/signup/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(const SignupState());

  void onPasswordChange(String value) {
    final password = PasswordValidator.dirty(value);
    final confirmPassword = state.confirmPasswordValidator.value.isEmpty
        ? null
        : ConfirmPasswordValidator.dirty(
            password: value,
            value: state.confirmPasswordValidator.value,
          );
    emit(
      state.copyWith(
        passwordValidator: password,
        confirmPasswordValidator: confirmPassword,
      ),
    );
  }

  void onConfirmPasswordChange(String value) {
    final confirmPassword = ConfirmPasswordValidator.dirty(
      password: state.passwordValidator.value,
      value: value,
    );
    emit(state.copyWith(confirmPasswordValidator: confirmPassword));
  }

  void onPhoneNumberChange(String value) {
    final phoneNumber = PhoneNumberValidator.dirty(value);
    emit(state.copyWith(phoneNumberValidator: phoneNumber));
  }

  void onNameChanged(String value) {
    final nameValidator = NameValidator.dirty(value);
    emit(state.copyWith(nameValidator: nameValidator));
  }

  void onSelectEnglishLevel(int level) {
    emit(state.copyWith(levelEnglish: level));
  }

  void onSelectYearOfBirth(int year) {
    emit(state.copyWith(birthOfYear: year));
  }

  void onShowPreviousYears() {
    emit(state.copyWith(yearPageIndex: state.yearPageIndex + 1));
  }

  void onResetYearPage() {
    emit(state.copyWith(yearPageIndex: 0));
  }
}
