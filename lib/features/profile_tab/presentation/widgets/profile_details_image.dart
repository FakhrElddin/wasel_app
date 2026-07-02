import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class ProfileDetailsItem extends StatelessWidget {
  const ProfileDetailsItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(text, style: AppStyles.medium20Text),
      ),
    );
  }
}
