import 'package:demo/core/theme/app_text_style.dart';
import 'package:flutter/widgets.dart';

class ValidText extends StatelessWidget {
  const ValidText({super.key, required this.validText});
  final String? validText;

  @override
  build(BuildContext context) {
    return Text(validText ?? '', style: AppTextStyle.successText);
  }
}
