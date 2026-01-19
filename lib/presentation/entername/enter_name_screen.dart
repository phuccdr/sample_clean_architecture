import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/core/widget/custom_button.dart';
import 'package:demo/presentation/entername/enter_name_cubit.dart';
import 'package:demo/presentation/entername/enter_name_state.dart';
import 'package:demo/shared/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({super.key});

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EnterNameCubit(),
      child: Scaffold(
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
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/ic_monkey_entername.png', width: 148),
        const SizedBox(width: 16),
        Expanded(
          child: Text('Tên của bé là ?', style: AppTextStyle.headerLarge),
        ),
      ],
    );
  }

  Widget _buildNameTextField() {
    return BlocBuilder<EnterNameCubit, EnterNameState>(
      builder: (context, state) {
        return TextField(
          controller: _nameController,
          onChanged: (value) {
            context.read<EnterNameCubit>().onNameChanged(value);
          },
          style: AppTextStyle.inputHint.copyWith(
            color: state.isValid ? AppColors.success : AppColors.textHint,
          ),
          decoration: InputDecoration(
            hintText: 'Tên',
            hintStyle: AppTextStyle.inputHint,
            suffixIcon: state.isValid
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
                color: state.isValid
                    ? AppColors.success
                    : AppColors.borderLight,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: state.isValid
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
    return BlocBuilder<EnterNameCubit, EnterNameState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: CustomButton(
            text: 'Tiếp tục',
            onPressed: state.isValid
                ? () => context.push(
                    '${AppRoutes.chooseYearOfBirth}/${state.name}',
                  )
                : null,
          ),
        );
      },
    );
  }
}
