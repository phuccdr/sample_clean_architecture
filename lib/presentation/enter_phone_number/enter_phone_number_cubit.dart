import 'package:demo/core/validator/phone_number_validator.dart';
import 'package:demo/presentation/enter_phone_number/enter_phone_number_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class EnterPhoneNumberCubit extends Cubit<EnterPhoneNumberState> {
  EnterPhoneNumberCubit() : super(const EnterPhoneNumberState());

  void onPhoneNumberChange(String value) {
    final phoneNumber = PhoneNumberValidator.dirty(value);
    emit(state.copyWith(phoneNumber: phoneNumber));
  }

  Future<void> onSubmit() async {
    if (!state.phoneNumber.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
