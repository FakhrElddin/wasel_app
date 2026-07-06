import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_details_screen_app_bar.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_gallery_section.dart';
import 'package:readmore/readmore.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_info_item.dart';

class BookDetailsScreenBody extends StatelessWidget {
  const BookDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BookDetailsScreenAppBar(),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: BookGallerySection()),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.appPadding),
            child: ReadMoreText(
              'Die Protestantische Ethik Und Der Geist Des Kapitalismus Die Protestantische Ethik Und Der Geist Des Kapitalismus',
              style: AppStyles.bold20Text,
              trimMode: TrimMode.Line,
              trimLines: 2,
              trimCollapsedText: AppStrings.showMoreString,
              trimExpandedText: AppStrings.showLessString,
              colorClickableText: AppColors.primaryColor,
              moreStyle: AppStyles.bold20Text.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.appPadding,
            ),
            child: BookInfoItem(label: 'Edition', value: '2001'),
          ),
        ),
      ],
    );
  }
}


