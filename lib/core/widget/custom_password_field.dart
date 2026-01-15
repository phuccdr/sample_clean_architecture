import 'package:demo/core/theme/app_text_style.dart' show AppTextStyle;
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.onChanged,
    this.errorWidget,
    required this.hintText,
  });

  final Function(String value) onChanged;
  final Widget? errorWidget;
  final String hintText;

  @override
  State<StatefulWidget> createState() {
    return CustomPasswordFieldState();
  }
}

class CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscure = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        onChanged: widget.onChanged,
        obscureText: _obscure,
        obscuringCharacter: '●',
        style: AppTextStyle.hintStyle,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppTextStyle.hintStyle,
          error: widget.errorWidget,
          suffixIcon: IconButton(
            icon: Icon(
              _obscure ? Icons.visibility_off : Icons.visibility,
              color: Color(0xFFAFAFAF),
            ),
            onPressed: () {
              setState(() {
                _obscure = !_obscure;
              });
            },
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFFAFAFAF)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFFAFAFAF)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFFFF4B4B)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
    );
  }
}
