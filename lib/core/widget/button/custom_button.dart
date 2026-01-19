import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.activeBackgroundColor = AppColors.primary,
    this.disabledBackgroundColor = AppColors.disabled,
    this.textActiveColor = AppColors.backgroundLight,
    this.textDisabledColor = AppColors.textDisabled,
    this.shadowActiveColor = AppColors.primaryDark,
    this.shadowDisabledColor = AppColors.disabled,
    this.isBorder = false,
    this.borderColor = AppColors.primaryDark,
  });

  final String text;
  final VoidCallback? onPressed;

  final Color activeBackgroundColor;
  final Color disabledBackgroundColor;
  final Color textActiveColor;
  final Color textDisabledColor;
  final Color shadowActiveColor;
  final Color shadowDisabledColor;
  final bool isBorder;
  final Color borderColor;

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
          color: onPressed != null
              ? activeBackgroundColor
              : disabledBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: onPressed != null
                  ? shadowActiveColor
                  : shadowDisabledColor,
              offset: const Offset(0, 4),
            ),
          ],
          border: isBorder ? Border.all(color: borderColor, width: 1) : null,
        ),
        child: Text(
          text,
          style: AppTextStyle.buttonText.copyWith(
            color: onPressed != null ? textActiveColor : textDisabledColor,
          ),
        ),
      ),
    );
  }
}
