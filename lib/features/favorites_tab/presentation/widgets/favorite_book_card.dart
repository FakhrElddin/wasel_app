import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_card.dart';

class FavoriteBookCard extends StatelessWidget {
  const FavoriteBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        BookCard(),
        Container(
          margin: EdgeInsetsDirectional.only(top: 12,end: 12,),
          decoration: BoxDecoration(
            color: AppColors.greyColor.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_rounded,
              color: AppColors.redColor,
              size: 32,
            ),
          ),
        ),
      ],
    );
  }
}