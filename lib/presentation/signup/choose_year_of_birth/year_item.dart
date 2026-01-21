import 'package:demo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class YearItem extends StatelessWidget {
  const YearItem({
    super.key,
    required this.year,
    required this.isSelected,
    required this.onTap,
  });

  final int year;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.selectedLight : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderLight,
            width: 2,
          ),
        ),
        child: Text(
          year.toString(),
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w700,
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
