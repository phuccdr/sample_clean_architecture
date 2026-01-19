import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.onChanged,
    this.errorWidget,
    required this.hintText,
    this.validWidget,
  });

  final Function(String value) onChanged;
  final Widget? errorWidget;
  final String hintText;
  final Widget? validWidget;

  @override
  State<StatefulWidget> createState() {
    return CustomPasswordFieldState();
  }
}

class CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscure = true;

  bool get _isValid => widget.validWidget != null && widget.errorWidget == null;

  Color get _borderColor {
    if (widget.errorWidget != null) {
      return AppColors.error;
    } else if (_isValid) {
      return AppColors.success;
    }
    return AppColors.textHint;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          onChanged: widget.onChanged,
          obscureText: _obscure,
          obscuringCharacter: '●',
          style: AppTextStyle.inputHint,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppTextStyle.inputHint,
            suffixIcon: IconButton(
              icon: Icon(
                _obscure ? Icons.visibility_off : Icons.visibility,
                color: AppColors.textHint,
              ),
              onPressed: () {
                setState(() {
                  _obscure = !_obscure;
                });
              },
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: _borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: _borderColor),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
        ),
        if (widget.errorWidget != null) widget.errorWidget!,
        if (_isValid) widget.validWidget!,
      ],
    );
  }
}
