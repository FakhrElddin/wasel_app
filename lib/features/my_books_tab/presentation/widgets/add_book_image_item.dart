import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class AddBookImageItem extends StatelessWidget {
  const AddBookImageItem({super.key, required this.photoName, this.onTap, this.imagePath});

  final String photoName;
  final void Function()? onTap;
  final File? imagePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withValues(
                    alpha: 0.3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Icon(
                Icons.add_photo_alternate_outlined,
                size: 32,
                color: AppColors.primaryColor,
              ),
              if(imagePath != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    imagePath!,
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            photoName,
            style: AppStyles.regular18Text.copyWith(
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
