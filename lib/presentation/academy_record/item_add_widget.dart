import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AddItemWidget extends StatelessWidget {
  final bool isAlone;

  const AddItemWidget({super.key, this.isAlone = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.backgroundLight,
            borderRadius: BorderRadius.circular(32),
          ),
          child: const Icon(size: 66, Icons.add, color: AppColors.border),
        ),
        const SizedBox(height: 12),
        Text(
          'Thêm hồ sơ',
          style: AppTextStyle.bodySmallBold.copyWith(color: AppColors.border),
        ),
      ],
    );
  }
}
