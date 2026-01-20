import 'package:demo/core/validator/confirm_password_validator.dart';
import 'package:demo/core/validator/name_validator.dart';
import 'package:demo/core/validator/password_validator.dart';
import 'package:demo/core/validator/phone_number_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class SignupState extends Equatable {
  final PhoneNumberValidator phoneNumberValidator;
  final PasswordValidator passwordValidator;
  final ConfirmPasswordValidator confirmPasswordValidator;
  final NameValidator nameValidator;
  final int? birthOfYear;
  final int levelEnglish;
  final int yearPageIndex;
  final FormzSubmissionStatus status;

  const SignupState({
    this.phoneNumberValidator = const PhoneNumberValidator.pure(),
    this.passwordValidator = const PasswordValidator.pure(),
    this.confirmPasswordValidator = const ConfirmPasswordValidator.pure(),
    this.nameValidator = const NameValidator.pure(),
    this.birthOfYear,
    this.levelEnglish = -1,
    this.yearPageIndex = 0,
    this.status = FormzSubmissionStatus.initial,
  });

  List<int> get availableYears {
    final currentYear = DateTime.now().year;
    return List.generate(
      12,
      (index) => currentYear - yearPageIndex * 12 - index,
    );
  }

  bool get isYearSelected => birthOfYear != null && birthOfYear! > 0;

  bool get isLevelSelected => levelEnglish > 0;

  @override
  List<Object?> get props => [
    phoneNumberValidator,
    passwordValidator,
    confirmPasswordValidator,
    nameValidator,
    birthOfYear,
    levelEnglish,
    yearPageIndex,
    status,
  ];

  SignupState copyWith({
    PhoneNumberValidator? phoneNumberValidator,
    PasswordValidator? passwordValidator,
    ConfirmPasswordValidator? confirmPasswordValidator,
    NameValidator? nameValidator,
    int? birthOfYear,
    int? levelEnglish,
    int? yearPageIndex,
    FormzSubmissionStatus? status,
  }) {
    return SignupState(
      phoneNumberValidator: phoneNumberValidator ?? this.phoneNumberValidator,
      passwordValidator: passwordValidator ?? this.passwordValidator,
      confirmPasswordValidator:
          confirmPasswordValidator ?? this.confirmPasswordValidator,
      nameValidator: nameValidator ?? this.nameValidator,
      birthOfYear: birthOfYear ?? this.birthOfYear,
      levelEnglish: levelEnglish ?? this.levelEnglish,
      yearPageIndex: yearPageIndex ?? this.yearPageIndex,
      status: status ?? this.status,
    );
  }
}
