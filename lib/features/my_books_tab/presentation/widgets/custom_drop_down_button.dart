import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/core/utils/app_validators.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key, this.items, required this.hint});

  final List<DropdownItem>? items;
  final String hint;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  final valueListenable = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        isExpanded: true,
        valueListenable: valueListenable,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        hint: Text(
          widget.hint,
          style: AppStyles.regular16Text.copyWith(color: AppColors.blackColor),
          overflow: TextOverflow.ellipsis,
        ),
        buttonStyleData: FormFieldButtonStyleData(
          height: 58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.blackColor),
            color: AppColors.greyColor.withValues(alpha: 0.2),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.whiteColor,
          ),
        ),
        items: widget.items,
        validator: (value) {
          return AppValidators.validate(value);
        },
        onChanged: (value) {
          valueListenable.value = value;
        },
      ),
    );
  }
}
