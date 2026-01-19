import 'package:flutter/material.dart';
import 'package:demo/core/theme/app_colors.dart';

class AppTextStyle {
  static const TextStyle inputHint = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w800,
    color: AppColors.textHint,
    fontSize: 18,
  );

  static const TextStyle bodySecondary = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w800,
    color: AppColors.textSecondary,
    fontSize: 18,
  );

  static const TextStyle linkText = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w800,
    fontSize: 18,
    color: AppColors.link,
  );

  static const TextStyle bodySmallBold = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodyMediumBold = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.textSecondary,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 20,
    color: AppColors.textTitle,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w800,
    fontSize: 18,
    color: AppColors.link,
  );

  static const TextStyle errorText = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: AppColors.error,
  );

  static const TextStyle headerLarge = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w800,
    fontSize: 24,
    color: AppColors.textPrimary,
  );

  static const TextStyle successText = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w700,
    color: AppColors.success,
    fontSize: 16,
  );

  static const TextStyle buttonText = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: Colors.white,
  );

  // Deprecated - use new names instead
  @Deprecated('Use inputHint instead')
  static const TextStyle hintStyle = inputHint;

  @Deprecated('Use bodySecondary instead')
  static const TextStyle textStyleSpanIntroActiveCode = bodySecondary;

  @Deprecated('Use linkText instead')
  static const TextStyle textStyleSpanActiveCode = linkText;

  @Deprecated('Use bodySmallBold instead')
  static const TextStyle body16ExtraboldStyle = bodySmallBold;

  @Deprecated('Use bodyMediumBold instead')
  static const TextStyle body18ExtraboldStyle = bodyMediumBold;

  @Deprecated('Use errorText instead')
  static const TextStyle textError = errorText;

  @Deprecated('Use headerLarge instead')
  static const TextStyle headerStyle = headerLarge;

  @Deprecated('Use successText instead')
  static const TextStyle validTextStyle = successText;

  @Deprecated('Use buttonText instead')
  static const TextStyle textButton = buttonText;
}
