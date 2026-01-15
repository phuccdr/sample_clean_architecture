import 'package:demo/data/network/model/academy_record.dart';
import 'package:flutter/material.dart';

class ItemAcademyRecordWidget extends StatelessWidget {
  final AcademyRecord item;

  const ItemAcademyRecordWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFDBF1FF),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFB8E0F7),
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[200],
              backgroundImage: NetworkImage(item.avatar),
              onBackgroundImageError: (exception, stackTrace) {},
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          item.name,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
