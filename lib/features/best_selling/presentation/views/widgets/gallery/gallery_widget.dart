import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'photo_tile.dart'; // Import the new PhotoTile widget

class PhotoGalleryWidget extends StatelessWidget {
  final List<String> imageUrls;

  const PhotoGalleryWidget({required this.imageUrls, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          SizedBox(
            height: 450.h,
            width: double.infinity,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return PhotoTile(
                    imageUrl: imageUrls[index]); // Use PhotoTile here
              },
            ),
          ),
        ],
      ),
    );
  }
}
