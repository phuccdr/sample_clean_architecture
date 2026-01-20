import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/core/widget/button/custom_button.dart';
import 'package:demo/presentation/signup/select_level_english/level_english_item.dart';
import 'package:demo/presentation/signup/signup_cubit.dart';
import 'package:demo/presentation/signup/signup_state.dart';
import 'package:demo/shared/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectLevelEnglishScreen extends StatelessWidget {
  const SelectLevelEnglishScreen({super.key});

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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        final cubit = context.read<SignupCubit>();
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/imv_monkey.png', width: 148),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Khả năng tiếng Anh hiện tại của bé?',
                        style: AppTextStyle.headerLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildLevelOptions(cubit, state),
                const Spacer(),
                CustomButton(
                  text: 'Tiếp tục',
                  onPressed: state.isLevelSelected
                      ? () {
                          context.push(AppRoutes.updateLearningData);
                        }
                      : null,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLevelOptions(SignupCubit cubit, SignupState state) {
    return Column(
      children: [
        LevelEnglishItem(
          isSelected: state.levelEnglish == 1,
          level: 'Bé chưa biết gì về tiếng anh',
          icon: 'assets/images/ic_level1_english.png',
          onPressed: () => cubit.onSelectEnglishLevel(1),
        ),
        const SizedBox(height: 12),
        LevelEnglishItem(
          isSelected: state.levelEnglish == 2,
          level: 'Bé nhận biết được vài từ đơn giản',
          icon: 'assets/images/ic_level2_english.png',
          onPressed: () => cubit.onSelectEnglishLevel(2),
        ),
        const SizedBox(height: 12),
        LevelEnglishItem(
          isSelected: state.levelEnglish == 3,
          level: 'Bé hiểu được câu ngắn, đơn giản',
          icon: 'assets/images/ic_level3_english.png',
          onPressed: () => cubit.onSelectEnglishLevel(3),
        ),
        const SizedBox(height: 12),
        LevelEnglishItem(
          isSelected: state.levelEnglish == 4,
          level: 'Bé đọc hiểu đoạn văn ngắn',
          icon: 'assets/images/ic_level4_english.png',
          onPressed: () => cubit.onSelectEnglishLevel(4),
        ),
      ],
    );
  }
}
