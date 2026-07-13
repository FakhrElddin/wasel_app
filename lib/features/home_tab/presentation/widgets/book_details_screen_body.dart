import 'package:flutter/material.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/features/home_tab/domain/entities/books_response_entity.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_details_screen_app_bar.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_gallery_section.dart';
import 'package:readmore/readmore.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_info_section.dart';

class BookDetailsScreenBody extends StatelessWidget {
  const BookDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    BooksDataEntity book =
        ModalRoute.of(context)!.settings.arguments as BooksDataEntity;
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              BookDetailsScreenAppBar(),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: BookGallerySection(
                  bookImages: [
                    book.coverImage!,
                    ...book.images!,
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.appPadding,
                    vertical: 24,
                  ),
                  child: ReadMoreText(
                    book.title!,
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
                  editionValue: book.edition.toString(),
                  categoryValue: book.category.toString(),
                  timeUsedValue: '${book.usedTime.toString()} Years',
                  priceValue: book.price.toString(),
                  statusValue: book.state!,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.appPadding,
          ),
          child: CustomTextButton(text: 'Order Now', onPressed: () {}),
        ),
        SafeArea(top: false, child: SizedBox()),
      ],
    );
  }
}
