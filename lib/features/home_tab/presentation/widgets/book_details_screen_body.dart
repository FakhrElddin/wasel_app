import 'package:flutter/material.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_details_screen_app_bar.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_gallery_section.dart';
import 'package:readmore/readmore.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_info_section.dart';

class BookDetailsScreenBody extends StatelessWidget {
  const BookDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              BookDetailsScreenAppBar(),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(child: BookGallerySection()),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.appPadding,
                    vertical: 24,
                  ),
                  child: ReadMoreText(
                    'Die Protestantische Ethik Und Der Geist Des Kapitalismus Die Protestantische Ethik Und Der Geist Des Kapitalismus ',
                    style: AppStyles.bold20Text,
                    trimMode: TrimMode.Line,
                    trimLines: 2,
                    trimCollapsedText: AppStrings.showMoreString,
                    trimExpandedText: AppStrings.showLessString,
                    moreStyle: AppStyles.bold20Text.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    lessStyle: AppStyles.bold20Text.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: BookInfoSection(
                  editionValue: '2002',
                  categoryValue: 'Political Science',
                  timeUsedValue: '3 Years',
                  priceValue: '250',
                  statusValue: 'Like New',
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.appPadding),
          child: CustomTextButton(
            text: 'Order Now',
            onPressed: () {},
          ),
        ),
        SafeArea(
          top: false,
          child: SizedBox(),
        ),
      ],
    );
  }
}
