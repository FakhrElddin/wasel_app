import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_strings.dart';

class BookGallerySection extends StatefulWidget {
  const BookGallerySection({super.key, required this.bookImages});

  final List<String> bookImages;

  @override
  State<BookGallerySection> createState() => _BookGallerySectionState();
}

class _BookGallerySectionState extends State<BookGallerySection> {
  // final List<String> bookImages = const [
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5BzJ80DaKE77ahFfnwsttMG3I2ouue8C6gg&s',
  //   'https://as1.ftcdn.net/jpg/03/89/07/14/1000_F_389071495_EXbWden6z83WkqXyz6yyCya7uNzyc70h.webp',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLGjFrAFp9Tyy2t71CoFgogvaUZivqrAaU-CJAfTS3FxYVgbykVX8i5QM&s',
  // ];
  PageController bookImagesController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: bookImagesController,
            itemBuilder: (context, index) => Center(
              child: InkWell(
                onTap: () {
                  navigateToGallery(index: index, bookImages: widget.bookImages);
                },
                child: CachedNetworkImage(
                  height: 300,
                  fit: BoxFit.fill,
                  imageUrl: widget.bookImages[index],
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            itemCount: widget.bookImages.length,
          ),
        ),
        const SizedBox(height: 16),
        SmoothPageIndicator(
          controller: bookImagesController,
          count: widget.bookImages.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: AppColors.primaryColor,
            dotWidth: 10,
            dotHeight: 10,
          ),
        ),
      ],
    );
  }

  void navigateToGallery({
    required int index,
    required List<String> bookImages,
  }) {
    Navigator.pushNamed(
      context,
      AppRoutes.bookGalleryScreenRoute,
      arguments: {
        AppStrings.bookImagesString: bookImages,
        AppStrings.initialIndexString: index,
      },
    );
  }
}
