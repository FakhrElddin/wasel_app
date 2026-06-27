import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class UnSelectedCategoryCard extends StatelessWidget {
  const UnSelectedCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.transparentColor, width: 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              width: 180,
              height: 120,
              fit: BoxFit.fill,
              imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5BzJ80DaKE77ahFfnwsttMG3I2ouue8C6gg&s',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
            ),
          ),
        ),
        Text('Sports', style: AppStyles.regular24Text),
      ],
    );
  }
}

class SelectedCategoryCard extends StatelessWidget {
  const SelectedCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor, width: 3),
            ),
            child: CachedNetworkImage(
              width: 180,
              height: 120,
              fit: BoxFit.fill,
              imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5BzJ80DaKE77ahFfnwsttMG3I2ouue8C6gg&s',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
            ),
          ),
        ),
        Text('Sports', style: AppStyles.regular24Text),
      ],
    );
  }
}