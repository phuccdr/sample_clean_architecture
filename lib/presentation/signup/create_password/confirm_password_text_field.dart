import 'package:demo/core/validator/confirm_password_validator.dart';
import 'package:demo/core/widget/error_text.dart';
import 'package:demo/core/widget/text_field/custom_password_field.dart';
import 'package:demo/core/widget/valid_text.dart';
import 'package:demo/presentation/signup/signup_cubit.dart';
import 'package:demo/presentation/signup/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return CustomPasswordField(
          onChanged: (value) =>
              context.read<SignupCubit>().onConfirmPasswordChange(value),
          hintText: 'Nhập lại mật khẩu',
          errorWidget:
              state.confirmPasswordValidator.displayError ==
                  ConfirmPasswordValidationError.empty
              ? const ErrorText(errorText: 'Vui lòng nhập lại mật khẩu')
              : state.confirmPasswordValidator.displayError ==
                    ConfirmPasswordValidationError.mismatch
              ? const ErrorText(errorText: 'Mật khẩu xác nhận không khớp')
              : null,
          validWidget: state.confirmPasswordValidator.isValid
              ? const ValidText(validText: 'Mật khẩu trùng khớp')
              : null,
        );
      },
    );
  }
}
