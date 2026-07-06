import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_info_item.dart';

class BookInfoSection extends StatelessWidget {
  const BookInfoSection({
    super.key,
    required this.editionValue,
    required this.categoryValue,
    required this.timeUsedValue,
    required this.priceValue,
    required this.statusValue,
  });

  final String editionValue;
  final String categoryValue;
  final String timeUsedValue;
  final String priceValue;
  final String statusValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppConstants.appPadding,
      ),
      child: Column(
        children: [
          BookInfoItem(label: AppStrings.editionString, value: editionValue),
          BookInfoItem(
            label: AppStrings.categoriesString,
            value: categoryValue,
          ),
          BookInfoItem(label: AppStrings.timeUsedString, value: timeUsedValue),
          BookInfoItem(label: AppStrings.priceString, value: priceValue),
          BookInfoItem(label: AppStrings.statusString, value: statusValue),
        ],
      ),
    );
  }
}
