import 'package:demo/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Text(errorText, style: AppTextStyle.textError);
  }
}
