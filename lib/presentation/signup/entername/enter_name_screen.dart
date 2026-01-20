import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/core/widget/button/custom_button.dart';
import 'package:demo/presentation/signup/signup_cubit.dart';
import 'package:demo/presentation/signup/signup_state.dart';
import 'package:demo/shared/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EnterNameScreen extends StatelessWidget {
  const EnterNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => context.pop(),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 12),
              _buildHeader(),
              const SizedBox(height: 24),
              _buildNameTextField(),
              const Spacer(),
              _buildContinueButton(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('assets/images/ic_monkey_entername.png', width: 148),
      const SizedBox(width: 16),
      Expanded(child: Text('Tên của bé là ?', style: AppTextStyle.headerLarge)),
    ],
  );
}

Widget _buildNameTextField() {
  return BlocBuilder<SignupCubit, SignupState>(
    builder: (context, state) {
      return TextFormField(
        onChanged: (value) {
          context.read<SignupCubit>().onNameChanged(value);
        },
        style: AppTextStyle.inputHint.copyWith(
          color: state.nameValidator.isValid
              ? AppColors.success
              : AppColors.textHint,
        ),
        decoration: InputDecoration(
          hintText: 'Tên',
          hintStyle: AppTextStyle.inputHint,
          suffixIcon: state.nameValidator.isValid
              ? const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.check_circle,
                    color: AppColors.success,
                    size: 24,
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: state.nameValidator.isValid
                  ? AppColors.success
                  : AppColors.borderLight,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: state.nameValidator.isValid
                  ? AppColors.success
                  : AppColors.borderLight,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
        ),
      );
    },
  );
}

Widget _buildContinueButton() {
  return BlocBuilder<SignupCubit, SignupState>(
    builder: (context, state) {
      return SizedBox(
        width: double.infinity,
        child: CustomButton(
          text: 'Tiếp tục',
          onPressed: state.nameValidator.isValid
              ? () => context.push(AppRoutes.chooseYearOfBirth)
              : null,
        ),
      );
    },
  );
}
