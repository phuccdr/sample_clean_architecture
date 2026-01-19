import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/core/widget/custom_button.dart';
import 'package:demo/shared/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GreetMonkey extends StatelessWidget {
  const GreetMonkey({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 68, left: 24, right: 24, bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Chào mừng bạn đến\nMonkey Stories',
            style: AppTextStyle.headerLarge.copyWith(color: AppColors.primary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  right: 6,
                  top: 0,
                  child: Image.asset(
                    'assets/images/ic_fire_work.png',
                    width: 103,
                  ),
                ),
                Positioned(
                  left: 6,
                  top: 64,
                  child: Image.asset(
                    'assets/images/ic_fire_work.png',
                    width: 103,
                  ),
                ),
                Positioned(
                  left: 36,
                  right: 36,
                  top: 128,
                  child: Image.asset('assets/images/ic_monkey_star.png'),
                ),
              ],
            ),
          ),
          CustomButton(
            text: 'Tiếp tục',
            onPressed: () {
              context.push(AppRoutes.enterName);
            },
          ),
        ],
      ),
    );
  }
}
