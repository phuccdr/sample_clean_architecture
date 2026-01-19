import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/widget/social_button.dart';
import 'package:flutter/material.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    super.key,
    this.onFacebookClick,
    this.onGoogleClick,
    this.onAppleClick,
  });

  final VoidCallback? onFacebookClick;
  final VoidCallback? onGoogleClick;
  final VoidCallback? onAppleClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: IconButton(
                onPressed: onFacebookClick?.call,
                icon: const SocialButton(
                  backgroundColor: AppColors.facebook,
                  assetPath: 'assets/images/ic_facebook.png',
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: IconButton(
                onPressed: onGoogleClick?.call,
                icon: const SocialButton(
                  backgroundColor: Colors.white,
                  assetPath: 'assets/images/ic_google.png',
                  borderColor: AppColors.border,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: IconButton(
                onPressed: onAppleClick?.call,
                icon: SocialButton(
                  backgroundColor: Colors.black,
                  assetPath: 'assets/images/ic_apple.png',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
