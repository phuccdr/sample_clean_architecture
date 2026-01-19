import 'package:formz/formz.dart';

enum PhoneNumberValidationError { invalid, empty }

class PhoneNumberValidator
    extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumberValidator.pure() : super.pure('');
  const PhoneNumberValidator.dirty([super.value = '']) : super.dirty();

  static final RegExp phoneVNRegExp = RegExp(r'^(0|\+84)[0-9]{9}$');

  @override
  PhoneNumberValidationError? validator(String? value) {
    if (value == null || value == '') {
      return PhoneNumberValidationError.empty;
    } else if (!phoneVNRegExp.hasMatch(value)) {
      return PhoneNumberValidationError.invalid;
    } else {
      return null;
    }
  }
}
