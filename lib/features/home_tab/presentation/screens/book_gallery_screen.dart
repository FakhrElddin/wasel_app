import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_thumbnail_item.dart';

class BookGalleryScreen extends StatefulWidget {
  const BookGalleryScreen({super.key});

  @override
  State<BookGalleryScreen> createState() => _BookGalleryScreenState();
}

class _BookGalleryScreenState extends State<BookGalleryScreen> {
  PageController? galleryController;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List<String> images =
        args[AppStrings.bookImagesString] as List<String>;
    final int initialIndex = args[AppStrings.initialIndexString] as int;
    if (galleryController == null) {
      currentIndex = initialIndex;
      galleryController = PageController(initialPage: initialIndex);
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.bookGalleryString,
          style: AppStyles.bold18Text.copyWith(color: AppColors.blackColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, size: 30),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Text(
              '${currentIndex + 1} of ${images.length}',
              style: AppStyles.bold20Text.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Expanded(
            child: PhotoViewGallery.builder(
              pageController: galleryController,
              backgroundDecoration: const BoxDecoration(color: Colors.white),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: CachedNetworkImageProvider(images[index]),
                  initialScale: PhotoViewComputedScale.contained,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 3.0,
                  heroAttributes: PhotoViewHeroAttributes(tag: images[index]),
                );
              },
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: SizedBox(
                height: 75,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                        galleryController!.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: BookThumbnailItem(
                        image: images[index],
                        isSelected: currentIndex == index,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SafeArea(top: false, child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
