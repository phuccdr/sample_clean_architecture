import 'package:formz/formz.dart';

enum EmailValidationError { invalid, empty }

class EmailValidator extends FormzInput<String, EmailValidationError> {
  const EmailValidator.pure() : super.pure('');
  const EmailValidator.dirty([super.value = '']) : super.dirty();

  static final RegExp phoneVNRegExp = RegExp(r'^(0|\+84)[0-9]{9}$');

  @override
  EmailValidationError? validator(String? value) {
    if (value == null || value == '') {
      return EmailValidationError.empty;
    } else if (!phoneVNRegExp.hasMatch(value)) {
      return EmailValidationError.invalid;
    } else {
      return null;
    }
  }
}
