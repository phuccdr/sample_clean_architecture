import 'package:demo/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class UpdateLearningData extends StatelessWidget {
  const UpdateLearningData({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 48),
            Text(
              'Monkey đang cập nhật\ndữ liệu học tập của bé',
              style: AppTextStyle.headerStyle,
            ),
            const SizedBox(height: 108),
          ],
        ),
      ),
    );
  }
}
