// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import "package:bu_ride/theme/palette.dart";
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ImageLoader extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double? radius;
  const ImageLoader({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 8),
      child: CachedNetworkImage(
        height: height ?? 83,
        width: width ?? 84,
        fit: BoxFit.cover,
        imageUrl: '',
        placeholder: (context, url) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black12.withOpacity(0.1),
                Colors.black12.withOpacity(0.1),
                Colors.black26,
                Colors.black26,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        )
            .animate(onPlay: (controller) => controller.repeat())
            .shimmer(duration: 1200.ms),
        errorWidget: (context, url, error) => Container(
          color: neutralWhite.withOpacity(0.1),
          child: const Center(
            child: Icon(
              Icons.error,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
