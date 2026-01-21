import 'package:demo/core/validator/password_validator.dart';
import 'package:demo/core/widget/error_text.dart';
import 'package:demo/core/widget/text_field/custom_password_field.dart';
import 'package:demo/presentation/login/login_cubit.dart';
import 'package:demo/presentation/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomPasswordField(
          onChanged: (value) =>
              context.read<LoginCubit>().onPasswordChange(value),
          hintText: 'Mật khẩu',
          errorWidget:
              state.password.displayError == PasswordValidationError.empty
              ? const ErrorText(errorText: 'Mật khẩu không được để trống')
              : state.password.displayError == PasswordValidationError.invalid
              ? const ErrorText(errorText: 'Mật khẩu phải có ít nhất 6 ký tự')
              : null,
        );
      },
    );
  }
}
