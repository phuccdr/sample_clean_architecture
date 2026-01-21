import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CheckListItem extends StatelessWidget {
  final String content;
  final bool isCompleted;
  
  const CheckListItem({
    super.key,
    required this.content,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? AppColors.primary : Colors.grey,
        ),
        const SizedBox(width: 12),
        Text(
          content,
          style: AppTextStyle.bodySmallBold.copyWith(
            color: isCompleted ? AppColors.primaryDark : Colors.grey,
          ),
        ),
      ],
    );
  }
}
