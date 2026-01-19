import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/core/validator/password_validator.dart';
import 'package:demo/core/validator/phone_number_validator.dart';
import 'package:demo/core/widget/bottom_section.dart';
import 'package:demo/core/widget/custom_button.dart';
import 'package:demo/core/widget/custom_password_field.dart';
import 'package:demo/core/widget/custom_text_field.dart';
import 'package:demo/core/widget/error_text.dart';
import 'package:demo/core/widget/two_text_span.dart';
import 'package:demo/presentation/login/login_cubit.dart';
import 'package:demo/presentation/login/login_state.dart';
import 'package:demo/shared/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (context) {
          return BlocListener<LoginCubit, LoginState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == FormzSubmissionStatus.success) {
                context.push(AppRoutes.academyRecord);
              }
            },
            child: Scaffold(
              appBar: _buildAppBar(),
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(child: _buildBody(context)),
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () {
          //navigator back
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _buildIllustration(),
              const SizedBox(height: 24),
              const EmailTextField(),
              const SizedBox(height: 12),
              const PasswordTextField(),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ID thiết bị: 100600',
                    style: AppTextStyle.bodySmallBold.copyWith(
                      color: AppColors.textHint,
                    ),
                  ),
                  Text(
                    'Quên mật khẩu?',
                    style: AppTextStyle.bodySmallBold.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomButton(
                onPressed: () {
                  context.read<LoginCubit>().onLogin();
                },
                text: 'Đăng nhập',
              ),
              const SizedBox(height: 24),
              TwoTextSpan(
                firstText: 'Nếu bạn có mã kích hoạt, ',
                firstTextStyle: AppTextStyle.bodySecondary,
                secondText: 'Nhập tại đây.',
                secondTextStyle: AppTextStyle.linkText,
              ),
              const SizedBox(height: 84),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 80, height: 1, color: AppColors.textHint),
                  Text(
                    ' Hoặc đăng nhập với ',
                    style: AppTextStyle.bodySmallBold,
                  ),
                  Container(width: 80, height: 1, color: AppColors.textHint),
                ],
              ),
              const SizedBox(height: 72),
              BottomSection(
                onFacebookClick: () => showLoginFacebookFail(context),
              ),
              const SizedBox(height: 24),
              TwoTextSpan(
                firstText: 'Bạn chưa có tài khoản? ',
                firstTextStyle: AppTextStyle.bodySecondary,
                secondText: 'Đăng ký',
                secondTextStyle: AppTextStyle.linkText,
                onSecondTextClick: () {
                  context.push(AppRoutes.enterPhoneNumber);
                },
              ),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }

  void showLoginFacebookFail(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (context) {
        return Center(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/ic_monkey_sad.png',
                        width: 176,
                      ),
                      const SizedBox(height: 12),
                      const Text('Thông báo', style: AppTextStyle.headerLarge),
                      const SizedBox(height: 12),
                      const Text(
                        'Đăng nhập bằng Facebook thất bại',
                        style: AppTextStyle.bodySmallBold,
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        text: 'Tôi đã hiểu',
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 16,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: Image.asset(
                    'assets/images/ic_close_dialog.png',
                    width: 48,
                    height: 48,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIllustration() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 116),
      child: Image.asset('assets/images/imv_monkey.png'),
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomTextField(
          onChanged: (value) => context.read<LoginCubit>().onEmailChange(value),
          hintText: 'Số điện thoại/Tên đăng nhập,',
          errorWidget:
              state.phoneNumber.displayError == PhoneNumberValidationError.empty
              ? const ErrorText(errorText: 'Số điện thoại cần nhập 6-15 chữ số')
              : state.phoneNumber.displayError ==
                    PhoneNumberValidationError.invalid
              ? const ErrorText(errorText: 'Số điện thoại không đúng')
              : null,
        );
      },
    );
  }
}

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
