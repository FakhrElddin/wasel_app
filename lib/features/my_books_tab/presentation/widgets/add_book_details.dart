import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wasel_app/core/components/custom_text_form_field.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/core/utils/app_validators.dart';
import 'package:wasel_app/features/my_books_tab/presentation/widgets/add_book_image_item.dart';
import 'package:wasel_app/features/my_books_tab/presentation/widgets/custom_drop_down_button.dart';

class AddBookDetails extends StatelessWidget {
  const AddBookDetails({super.key});

  final List<String> bookCategories = const [
    'general 1',
    'general 2',
    'general 3',
    'general 4',
    'general 5',
  ];
  final List<String> bookStates = const ['new', 'like new', 'used'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        right: AppConstants.appPadding,
        left: AppConstants.appPadding,
      ),
      child: Form(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.bookPhotosString,
                  style: AppStyles.regular18Text.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: AddBookImageItem(
                        photoName: AppStrings.coverString,
                        onTap: () {},
                        imagePath: null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AddBookImageItem(
                        photoName: AppStrings.stubString,
                        onTap: () {},
                        imagePath: null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AddBookImageItem(
                        photoName: AppStrings.printingString,
                        onTap: () {},
                        imagePath: null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  AppStrings.bookInformationString,
                  style: AppStyles.regular18Text.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  hintText: AppStrings.nameString,
                  labelText: AppStrings.nameString,
                  filledColor: true,
                  fillColor: AppColors.greyColor.withValues(alpha: 0.2),
                  validator: AppValidators.validate,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomTextFormField(
                        hintFontSize: 12,
                        hintText: AppStrings.egp200String,
                        labelText: AppStrings.priceString,
                        filledColor: true,
                        fillColor: AppColors.greyColor.withValues(alpha: 0.2),
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: AppValidators.validate,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 4,
                      child: CustomTextFormField(
                        hintFontSize: 12,
                        hintText: AppStrings.years2String,
                        labelText: AppStrings.usedTimeString,
                        filledColor: true,
                        fillColor: AppColors.greyColor.withValues(alpha: 0.2),
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: AppValidators.validate,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: CustomTextFormField(
                        hintFontSize: 12,
                        hintText: AppStrings.string1990,
                        labelText: AppStrings.editionString,
                        filledColor: true,
                        fillColor: AppColors.greyColor.withValues(alpha: 0.2),
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: AppValidators.validate,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.bookCategoryString,
                            style: AppStyles.regular18Text.copyWith(
                              color: AppColors.blackColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          CustomDropDownButton(
                            hint: AppStrings.categoryString,
                            items: bookCategories
                                .map(
                                  (category) => DropdownItem(
                                    value: category,
                                    child: Text(category),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.bookStateString,
                            style: AppStyles.regular18Text.copyWith(
                              color: AppColors.blackColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          CustomDropDownButton(
                            hint: AppStrings.stateString,
                            items: bookStates
                                .map(
                                  (state) => DropdownItem(
                                    value: state,
                                    child: Text(state),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
