import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectSkillEnglishScreen extends StatefulWidget {
  const SelectSkillEnglishScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SelecSkillEnglishState();
  }
}

class _SelecSkillEnglishState extends State<SelectSkillEnglishScreen> {
  late int selectedSkill = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            context.pop();
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/imv_monkey.png', width: 148),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Khả năng tiếng Anh hiện tại của bé?',
                    style: AppTextStyle.headerLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ItemSkillEnglish(
              isSelected: selectedSkill == 1,
              level: 'Bé chưa biết gì về tiếng anh',
              icon: 'assets/images/ic_level1_english.png',
              onPressed: () {
                setState(() {
                  selectedSkill = 1;
                });
              },
            ),
            const SizedBox(height: 12),
            ItemSkillEnglish(
              isSelected: selectedSkill == 2,
              level: 'Bé nhận biết được vài từ đơn giản',
              icon: 'assets/images/ic_level2_english.png',
              onPressed: () {
                setState(() {
                  selectedSkill = 2;
                });
              },
            ),
            const SizedBox(height: 12),
            ItemSkillEnglish(
              isSelected: selectedSkill == 3,
              level: 'Bé hiểu được câu ngắn, đơn giản',
              icon: 'assets/images/ic_level3_english.png',
              onPressed: () {
                setState(() {
                  selectedSkill = 3;
                });
              },
            ),
            const SizedBox(height: 12),
            ItemSkillEnglish(
              isSelected: selectedSkill == 4,
              level: 'Bé đọc hiểu đoạn văn ngắn',
              icon: 'assets/images/ic_level4_english.png',
              onPressed: () {
                setState(() {
                  selectedSkill = 4;
                });
              },
            ),
            const Spacer(),
            CustomButton(
              text: 'Tiếp tục',
              onPressed: selectedSkill != -1 ? () {} : null,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class ItemSkillEnglish extends StatelessWidget {
  const ItemSkillEnglish({
    super.key,
    required this.isSelected,
    required this.level,
    required this.icon,
    this.onPressed,
  });

  final bool isSelected;
  final String level;
  final String icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.selectedVeryLight : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderLight,
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(icon, width: 28),
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                level,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
