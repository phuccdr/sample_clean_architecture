import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/data/network/model/country.dart';
import 'package:flutter/material.dart';

class PhoneNumberCountry extends StatefulWidget {
  const PhoneNumberCountry({super.key, required this.onChanged, this.isValid});

  final Function(String value) onChanged;
  final bool? isValid;

  @override
  State<StatefulWidget> createState() => PhoneNumberCountryState();
}

class PhoneNumberCountryState extends State<PhoneNumberCountry> {
  final List<Country> countries = [
    Country('1', 'VN', '+84', 'assets/images/ic_flag_vn.png'),
    Country('2', 'US', '+1', 'assets/images/ic_flag_vn.png'),
    Country('3', 'JP', '+81', 'assets/images/ic_flag_rus.png'),
    Country('4', 'KR', '+82', 'assets/images/ic_flag_rus.png'),
    Country('5', 'CN', '+86', 'assets/images/ic_flag_vn.png'),
    Country('6', 'FR', '+33', 'assets/images/ic_flag_rus.png'),
    Country('7', 'DE', '+49', 'assets/images/ic_flag_vn.png'),
    Country('8', 'GB', '+44', 'assets/images/ic_flag_rus.png'),
  ];

  Country _selectedCountry = Country(
    '1',
    'VN',
    '+84',
    'assets/images/ic_flag_vn.png',
  );

  bool isDropDown = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: widget.onChanged,
          style: AppTextStyle.titleLarge,
          decoration: InputDecoration(
            prefixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isDropDown = !isDropDown;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(_selectedCountry.flag, width: 24, height: 24),
                    const SizedBox(width: 8),
                    Icon(
                      isDropDown
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.textPrimary,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 1,
                      height: 24,
                      color: AppColors.textHint,
                    ),
                  ],
                ),
              ),
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            suffixIcon: widget.isValid == true
                ? const Icon(Icons.check_circle, color: AppColors.success)
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.textHint),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.isValid == true
                    ? AppColors.success
                    : AppColors.textHint,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (widget.isValid == true) ...[
          Text('Số điện thoại khả dụng.', style: AppTextStyle.successText),
        ],
        if (isDropDown) ...[
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200, maxWidth: 180),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  return _buildItemCountry(countries[index]);
                },
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildItemCountry(Country country) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCountry = country;
          isDropDown = !isDropDown;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              country.code,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Image.asset(country.flag, width: 32, height: 32),
          ],
        ),
      ),
    );
  }
}
