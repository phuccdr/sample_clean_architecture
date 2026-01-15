import 'package:flutter/material.dart';

class AddItemWidget extends StatelessWidget {
  const AddItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 180,
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: Color(0xFFF2F4F7),
          ),
          child: Icon(size: 66, Icons.add, color: Color(0xFFD0D5DD)),
        ),
        const SizedBox(height: 8),
        Text(
          'Thêm',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w700,
            color: Color(0xFFD0D5DD),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
