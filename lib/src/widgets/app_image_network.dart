import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../core/constant/app_base_url.dart';

class AppImageNetwork extends StatelessWidget {
  AppImageNetwork({super.key, required this.url, required this.borderRadius});
  String url;
  BorderRadius borderRadius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    if (url.contains('http') || url.contains('https')) {
    } else {
      url = BASE_URL + url;
    }
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress),
        ),
        errorWidget: (context, url, error) => Image.network(
          'https://via.placeholder.com/350x150',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
