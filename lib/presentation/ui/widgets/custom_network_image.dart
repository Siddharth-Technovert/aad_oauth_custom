import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'shimmer/common_shimmer.dart';

const spareImageUrl = "https://demofree.sirv.com/nope-not-here.jpg";

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    required this.imageUrl,
    this.aspectRatio = 16 / 9,
    // this.height = 100,
    // this.width = 100,
    super.key,
  });

  final String? imageUrl;
  // final double height;
  // final double width;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: CachedNetworkImage(
        imageUrl: imageUrl != null && imageUrl!.contains('http')
            ? imageUrl!
            : spareImageUrl,
        progressIndicatorBuilder: (context, url, progress) =>
            const CommonShimmer(
          height: double.infinity,
          width: double.infinity,
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        // height: UIDimensions.height(height),
        // width: UIDimensions.width(width),
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
