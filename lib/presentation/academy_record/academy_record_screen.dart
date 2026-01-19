import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/data/network/model/academy_record.dart';
import 'package:demo/presentation/academy_record/item_academy_record_widget.dart';
import 'package:demo/presentation/academy_record/item_add_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AcademyRecordScreen extends StatefulWidget {
  const AcademyRecordScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AcademyRecordState();
  }
}

class _AcademyRecordState extends State<AcademyRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      backgroundColor: Colors.white,
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
        onPressed: () {
          context.pop();
        },
      ),
      centerTitle: true,
      title: Text('Hồ sơ học tập', style: AppTextStyle.titleLarge),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: AppColors.textPrimary),
          onPressed: () {
            //setting
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: _buildListView()),
          const SizedBox(height: 16),
          Text('Nhập mã kích hoạt', style: AppTextStyle.titleMedium),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildListView() {
    final List<AcademyRecord> list = [
      AcademyRecord(
        id: '1',
        name: 'User1',
        avatar: 'https://picfiles.alphacoders.com/318/31834.jpg',
      ),
      AcademyRecord(
        id: '2',
        name: 'User2',
        avatar: 'https://picfiles.alphacoders.com/318/31834.jpg',
      ),
      AcademyRecord(
        id: '3',
        name: 'User4',
        avatar: 'https://picfiles.alphacoders.com/318/31834.jpg',
      ),
      AcademyRecord(
        id: '4',
        name: 'User5',
        avatar: 'https://picfiles.alphacoders.com/318/31834.jpg',
      ),
    ];

    const int crossAxisCount = 2;
    final int totalItems = list.length + 1; // +1 cho nút "Thêm"
    final bool isAddButtonAlone = totalItems % crossAxisCount == 1;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
              childAspectRatio: 0.85,
            ),
            // Nếu AddButton ở một mình, không hiển thị trong GridView
            itemCount: isAddButtonAlone ? list.length : totalItems,
            itemBuilder: (BuildContext context, int index) {
              if (index == list.length) {
                return const AddItemWidget();
              }
              return ItemAcademyRecordWidget(item: list[index]);
            },
          ),
          // Nếu AddButton ở một mình, hiển thị riêng và căn giữa
          if (isAddButtonAlone) ...[
            const SizedBox(height: 16),
            const AddItemWidget(isAlone: true),
          ],
        ],
      ),
    );
  }
}
