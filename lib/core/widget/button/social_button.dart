import 'package:flutter/widgets.dart';

class SocialButton extends StatelessWidget {
  final Color backgroundColor;
  final String assetPath;
  final Color? borderColor;

  const SocialButton({
    super.key,
    required this.backgroundColor,
    required this.assetPath,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: borderColor != null
            ? Border.all(width: 1, color: borderColor!)
            : null,
      ),
      alignment: Alignment.center,
      child: SizedBox(width: 24, height: 24, child: Image.asset(assetPath)),
    );
  }
}
