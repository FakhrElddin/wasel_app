import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/features/home_tab/domain/entities/books_response_entity.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_card.dart';

class FavoriteBookCard extends StatelessWidget {
  const FavoriteBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        BookCard(
          book: BooksDataEntity(
            coverImage: 'https://static.vecteezy.com/system/resources/thumbnails/044/280/984/small_2x/stack-of-books-on-a-brown-background-concept-for-world-book-day-photo.jpg',
            price: 250,
            title: 'book name',
            user: BooksUserEntity(name: 'user name'),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 12,end: 12,),
          decoration: BoxDecoration(
            color: AppColors.greyColor.withValues(alpha: 0.4),
            shape: BoxShape.circle,
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