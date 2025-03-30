import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'custom_indicator.dart';

class CacheImage extends StatelessWidget {
   const CacheImage({
    super.key,
    required this.url,
    this.height,
    this.width,
  });
  final String url;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      
      height: height,
      width: double.infinity,
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          SizedBox(height: height, child: const CustomCircleIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
