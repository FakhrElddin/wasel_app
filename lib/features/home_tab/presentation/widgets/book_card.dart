import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/features/home_tab/domain/entities/books_response_entity.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final BooksDataEntity book;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: CachedNetworkImage(
              height: 200,
              fit: BoxFit.fill,
              imageUrl: book.coverImage!,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Shimmer.fromColors(
                    baseColor: AppColors.greyColor.withValues(alpha: 0.5),
                    highlightColor: AppColors.greyColor.withValues(alpha: 0.1),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.greyColor.withValues(alpha: 0.5),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title!,
                  style: AppStyles.bold16Text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  '${book.price} EGP',
                  style: AppStyles.bold16Text.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.transparentColor,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          imageUrl:
                              book.user?.profileImage ??
                              "https://img.magnific.com/free-photo/3d-cartoon-portrait-person-practicing-law-related-profession_23-2151419548.jpg?t=st=1783796653~exp=1783800253~hmac=f6376771fe42634333ce087b66b1cc65271e2e0e3e25a4500f2ba3e8ccd8118c&w=1480",
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  Shimmer.fromColors(
                                    baseColor: AppColors.greyColor.withValues(
                                      alpha: 0.5,
                                    ),
                                    highlightColor: AppColors.greyColor
                                        .withValues(alpha: 0.1),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: AppColors.greyColor.withValues(
                                          alpha: 0.5,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                          errorWidget: (context, url, error) =>
                              const Center(child: Icon(Icons.error)),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        book.user!.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.bold16Text,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
