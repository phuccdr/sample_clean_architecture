import 'package:demo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LevelEnglishItem extends StatelessWidget {
  const LevelEnglishItem({
    super.key,
    required this.isSelected,
    required this.level,
    required this.icon,
    this.onPressed,
  });

  final bool isSelected;
  final String level;
  final String icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.selectedVeryLight : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderLight,
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(icon, width: 28),
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                level,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
