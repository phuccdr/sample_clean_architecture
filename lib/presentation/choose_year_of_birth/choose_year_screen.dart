import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/core/widget/custom_button.dart';
import 'package:demo/shared/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChooseYearScreen extends StatefulWidget {
  const ChooseYearScreen({super.key, required this.name});

  final String name;

  @override
  State<ChooseYearScreen> createState() {
    return _ChooseYearScreenState();
  }
}

class _ChooseYearScreenState extends State<ChooseYearScreen> {
  late int currentYear;
  late List<int> years;
  late int count = 0;
  late int selectedYear = -1;

  @override
  void initState() {
    super.initState();
    currentYear = DateTime.now().year;
    years = List.generate(12, (index) => currentYear - count * 12 - index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Image.asset('assets/images/imv_monkey.png', width: 148),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '${widget.name} sinh vào năm nào?',
                    style: AppTextStyle.headerLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.17,
              ),
              itemCount: years.length,
              itemBuilder: (BuildContext context, int index) {
                final bool isSelected = (selectedYear == years[index]);
                debugPrint('Log debug Flutter: ${years[index]}');
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedYear = years[index];
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.selectedLight
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.borderLight,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      years[index].toString(),
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        fontWeight:
                            isSelected ? FontWeight.w800 : FontWeight.w700,
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => setState(() {
                count++;
                years = List.generate(
                  12,
                  (index) => currentYear - count * 12 - index,
                );
              }),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: AppColors.borderLight),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Sinh trước năm ${years.last}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSecondary,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
            const Spacer(),
            CustomButton(
              text: 'Tiếp tục',
              onPressed: selectedYear != -1
                  ? () {
                      context.push(AppRoutes.selectSkillEnglish);
                    }
                  : null,
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
