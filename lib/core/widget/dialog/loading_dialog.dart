import 'package:demo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppDialog {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: AppColors.overlayBackground.withValues(alpha: 0.4),
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Container(
            width: 104,
            height: 102,
            padding: EdgeInsets.all(24),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.overlayBackground.withValues(alpha: 0.24),
            ),
            child: Image.asset('assets/images/ic_loading.png'),
          ),
        );
      },
    );
  }
}
