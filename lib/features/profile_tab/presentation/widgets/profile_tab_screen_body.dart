import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class ProfileTabScreenBody extends StatelessWidget {
  const ProfileTabScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ClipRRect(
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: 'https://t3.ftcdn.net/jpg/06/92/34/64/240_F_692346400_UzYGmrJm6qhyPPXyZeUGuyEhkwr1iSFN.jpg',
                  imageBuilder: (context, imageProvider) => Container(
                    width: 180.0,
                    height: 180.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(),
                      ),
                  errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Email',
              style: AppStyles.regular20Text,
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileDetailsItem(
              text: 'user@gmail.com',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Full name',
              style: AppStyles.regular20Text,
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileDetailsItem(
              text: 'user name',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Card ID",
              style: AppStyles.regular20Text,
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileDetailsItem(
              text: '30204314124124',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "City/Region",
              style: AppStyles.regular20Text,
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileDetailsItem(
              text: 'Cairo',
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextButton(
              text: 'Update profile',
              onPressed: (){},
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextButton(
              text: 'Log Out',
              backgroundColor: AppColors.redColor,
              onPressed: (){},
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailsItem extends StatelessWidget {
  const ProfileDetailsItem({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          text,
          style: AppStyles.medium20Text,
        ),
      ),
    );
  }
}
