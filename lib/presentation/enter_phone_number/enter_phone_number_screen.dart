import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/core/widget/bottom_section.dart';
import 'package:demo/core/widget/button/custom_button.dart';
import 'package:demo/core/widget/two_text_span.dart';
import 'package:demo/presentation/enter_phone_number/enter_phone_number_cubit.dart';
import 'package:demo/presentation/enter_phone_number/enter_phone_number_state.dart';
import 'package:demo/presentation/enter_phone_number/phone_number_country_text_field.dart';
import 'package:demo/shared/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class EnterPhoneNumberScreen extends StatelessWidget {
  const EnterPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EnterPhoneNumberCubit(),
      child: Builder(
        builder: (context) {
          return BlocListener<EnterPhoneNumberCubit, EnterPhoneNumberState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
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
        },
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
            BlocBuilder<EnterPhoneNumberCubit, EnterPhoneNumberState>(
              builder: (context, state) {
                return CustomButton(
                  onPressed: state.phoneNumber.isValid
                      ? () {
                          context.read<EnterPhoneNumberCubit>().onSubmit();
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
                _showConfirmDialog(context);
              },
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }

  void _showConfirmDialog(BuildContext context) {
    showDialog(
      barrierColor: AppColors.overlayBackground.withValues(alpha: 0.4),
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return SafeArea(
          child: Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 24),
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(right: 6, top: 6),
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
                          'assets/images/ic_monkey_wow.png',
                          width: 176,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Thông báo',
                          style: AppTextStyle.headerLarge,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Ba mẹ sẽ mất đi hồ sơ học [tên profile trial], ba mẹ có muốn đăng nhập không?',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bodySmallBold,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: 'Hủy',
                                onPressed: () {
                                  context.pop();
                                },
                                activeBackgroundColor: Colors.white,
                                textActiveColor: AppColors.primary,
                                shadowActiveColor: AppColors.primary,
                                isBorder: true,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomButton(
                                text: 'Đăng nhập',
                                onPressed: () {
                                  context.pop();
                                  context.pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -6,
                  right: -6,
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: Image.asset(
                        'assets/images/ic_close_dialog.png',
                        width: 48,
                        height: 48,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PhoneNumberCountryTextField extends StatelessWidget {
  const PhoneNumberCountryTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnterPhoneNumberCubit, EnterPhoneNumberState>(
      builder: (context, state) {
        return PhoneNumberCountry(
          onChanged: (value) =>
              context.read<EnterPhoneNumberCubit>().onPhoneNumberChange(value),
          isValid: state.phoneNumber.isValid,
        );
      },
    );
  }
}
