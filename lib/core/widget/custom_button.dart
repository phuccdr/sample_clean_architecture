import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed?.call();
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: onPressed != null ? AppColors.primary : AppColors.disabled,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: onPressed != null
                  ? AppColors.primaryDark
                  : AppColors.disabledShadow,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          text,
          style: AppTextStyle.buttonText.copyWith(
            color: onPressed != null ? Colors.white : AppColors.textDisabled,
          ),
        ),
      ),
    );
  }
}
