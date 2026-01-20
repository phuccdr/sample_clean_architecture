import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/core/widget/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  static void showConfirmDialog(BuildContext context) {
    showDialog(
      barrierColor: AppColors.overlayBackground.withValues(alpha: 0.4),
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return SafeArea(
          child: Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 24),
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(right: 6, top: 6),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/ic_monkey_wow.png',
                          width: 176,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Thông báo',
                          style: AppTextStyle.headerLarge,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Ba mẹ sẽ mất đi hồ sơ học [tên profile trial], ba mẹ có muốn đăng nhập không?',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bodySmallBold,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: 'Hủy',
                                onPressed: () {
                                  context.pop();
                                },
                                activeBackgroundColor: Colors.white,
                                textActiveColor: AppColors.primary,
                                shadowActiveColor: AppColors.primary,
                                isBorder: true,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomButton(
                                text: 'Đăng nhập',
                                onPressed: () {
                                  context.pop();
                                  context.pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -6,
                  right: -6,
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: Image.asset(
                        'assets/images/ic_close_dialog.png',
                        width: 48,
                        height: 48,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
