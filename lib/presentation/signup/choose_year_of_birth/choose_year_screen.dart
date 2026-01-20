import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/core/widget/button/custom_button.dart';
import 'package:demo/presentation/signup/signup_cubit.dart';
import 'package:demo/presentation/signup/signup_state.dart';
import 'package:demo/shared/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChooseYearScreen extends StatelessWidget {
  const ChooseYearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(state),
                const SizedBox(height: 24),
                _buildYearGrid(context, state),
                const SizedBox(height: 12),
                _buildPreviousYearsButton(context, state),
                const Spacer(),
                _buildContinueButton(context, state),
                const SizedBox(height: 28),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(SignupState state) {
    return Row(
      children: [
        Image.asset('assets/images/imv_monkey.png', width: 148),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            '${state.nameValidator.value} sinh vào năm nào?',
            style: AppTextStyle.headerLarge,
          ),
        ),
      ],
    );
  }

  Widget _buildYearGrid(BuildContext context, SignupState state) {
    final cubit = context.read<SignupCubit>();
    final years = state.availableYears;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.17,
      ),
      itemCount: years.length,
      itemBuilder: (context, index) {
        final year = years[index];
        final isSelected = state.birthOfYear == year;
        return YearItem(
          year: year,
          isSelected: isSelected,
          onTap: () => cubit.onSelectYearOfBirth(year),
        );
      },
    );
  }

  Widget _buildPreviousYearsButton(BuildContext context, SignupState state) {
    final cubit = context.read<SignupCubit>();
    final years = state.availableYears;

    return GestureDetector(
      onTap: () => cubit.onShowPreviousYears(),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColors.borderLight),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          'Sinh trước năm ${years.last}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textSecondary,
            fontFamily: 'Nunito',
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context, SignupState state) {
    return CustomButton(
      text: 'Tiếp tục',
      onPressed: state.isYearSelected
          ? () => context.push(AppRoutes.selectSkillEnglish)
          : null,
    );
  }
}

class YearItem extends StatelessWidget {
  const YearItem({
    super.key,
    required this.year,
    required this.isSelected,
    required this.onTap,
  });

  final int year;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.selectedLight : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderLight,
            width: 2,
          ),
        ),
        child: Text(
          year.toString(),
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w700,
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
