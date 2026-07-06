import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class BookInfoItem extends StatelessWidget {
  const BookInfoItem({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.blackColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text('$label :', style: AppStyles.bold20Text),
        const SizedBox(width: 4),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.primaryColor, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: Text(value, style: AppStyles.semiBold18Text),
          ),
        ),
      ],
    );
  }
}
