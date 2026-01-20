import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/core/widget/bottom_section.dart';
import 'package:demo/core/widget/button/custom_button.dart';
import 'package:demo/core/widget/dialog/app_dialog.dart';
import 'package:demo/core/widget/two_text_span.dart';
import 'package:demo/presentation/signup/enter_phone_number/phone_number_country_text_field.dart';
import 'package:demo/presentation/signup/signup_cubit.dart';
import 'package:demo/presentation/signup/signup_state.dart';
import 'package:demo/shared/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class EnterPhoneNumberScreen extends StatelessWidget {
  const EnterPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.success) {
          context.push(AppRoutes.createPassword);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        body: SingleChildScrollView(child: _buildBody(context)),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset('assets/images/imv_monkey.png', width: 152),
            ),
            const SizedBox(height: 12),
            Text('Nhập số điện thoại', style: AppTextStyle.headerLarge),
            const SizedBox(height: 20),
            const PhoneNumberCountryTextField(),
            const SizedBox(height: 160),
            BlocBuilder<SignupCubit, SignupState>(
              builder: (context, state) {
                return CustomButton(
                  onPressed: state.phoneNumberValidator.isValid
                      ? () {
                          context.push(AppRoutes.createPassword);
                        }
                      : null,
                  text: 'Tiếp tục',
                );
              },
            ),
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 80, height: 1, color: AppColors.textHint),
                Text(' Hoặc đăng nhập với ', style: AppTextStyle.bodySmallBold),
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
              onSecondTextClick: () {
                AppDialog.showConfirmDialog(context);
              },
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}

class PhoneNumberCountryTextField extends StatelessWidget {
  const PhoneNumberCountryTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return PhoneNumberCountry(
          onChanged: (value) =>
              context.read<SignupCubit>().onPhoneNumberChange(value),
          isValid: state.phoneNumberValidator.isValid,
        );
      },
    );
  }
}
