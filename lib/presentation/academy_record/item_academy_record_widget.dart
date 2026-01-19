import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/data/network/model/academy_record.dart';
import 'package:flutter/material.dart';

class ItemAcademyRecordWidget extends StatelessWidget {
  final AcademyRecord item;

  const ItemAcademyRecordWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.backgroundBlueLight,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.backgroundBlueCircle,
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[200],
              backgroundImage: NetworkImage(item.avatar),
              onBackgroundImageError: (exception, stackTrace) {},
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          item.name,
          style: AppTextStyle.bodySmallBold.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
