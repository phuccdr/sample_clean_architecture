import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class TwoTextSpan extends StatelessWidget {
  final String firstText;
  final TextStyle firstTextStyle;
  final String secondText;
  final TextStyle secondTextStyle;
  final VoidCallback? onFirstTextClick;
  final VoidCallback? onSecondTextClick;

  const TwoTextSpan({
    super.key,
    required this.firstText,
    required this.firstTextStyle,
    required this.secondText,
    required this.secondTextStyle,
    this.onFirstTextClick,
    this.onSecondTextClick,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: firstTextStyle,
          recognizer: onFirstTextClick != null
              ? (TapGestureRecognizer()..onTap = onFirstTextClick)
              : null,
          children: [
            TextSpan(
              text: secondText,
              style: secondTextStyle,
              recognizer: onSecondTextClick != null
                  ? (TapGestureRecognizer()..onTap = onSecondTextClick)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
