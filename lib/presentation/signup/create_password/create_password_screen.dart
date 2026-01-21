import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/core/widget/bottom_section.dart';
import 'package:demo/core/widget/button/custom_button.dart';
import 'package:demo/core/widget/two_text_span.dart';
import 'package:demo/presentation/signup/create_password/confirm_password_text_field.dart';
import 'package:demo/presentation/signup/create_password/password_text_field_signup.dart';
import 'package:demo/presentation/signup/signup_cubit.dart';
import 'package:demo/presentation/signup/signup_state.dart';
import 'package:demo/shared/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.success) {
          context.go(AppRoutes.greetMonkey);
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(child: _buildBody(context)),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      elevation: 0,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/imv_monkey.png', width: 152),
              ),
              const SizedBox(height: 12),
              Text('Tạo mật khẩu', style: AppTextStyle.headerLarge),
              const SizedBox(height: 22),
              const PasswordTextField(),
              const SizedBox(height: 16),
              const ConfirmPasswordTextField(),
              const SizedBox(height: 32),
              BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state) {
                  return CustomButton(
                    onPressed:
                        state.confirmPasswordValidator.isValid &&
                            state.passwordValidator.isValid
                        ? () {
                            context.push(AppRoutes.greetMonkey);
                          }
                        : null,
                    text: 'Tiếp tục',
                  );
                },
              ),
              const SizedBox(height: 40),
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
              const SizedBox(height: 40),
              const BottomSection(),
              const SizedBox(height: 24),
              TwoTextSpan(
                firstText: 'Bạn đã có tài khoản.  ',
                firstTextStyle: AppTextStyle.bodySecondary,
                secondText: 'Đăng nhập',
                secondTextStyle: AppTextStyle.linkText,
              ),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
