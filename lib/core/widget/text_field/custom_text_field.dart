import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.onChanged,
    this.errorWidget,
    required this.hintText,
  });

  final Function(String value) onChanged;
  final Widget? errorWidget;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: onChanged,
          style: AppTextStyle.inputHint,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyle.inputHint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.textHint),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.textHint),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
        ),
        if (errorWidget != null) errorWidget!,
      ],
    );
  }
}
