import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_characters/core/theming/colors.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.placeholderSize = 50,
    this.placeholderColor,
    this.errorWidget,
  });

  final String imageUrl;
  final BoxFit fit;
  final double? height;
  final double? width;
  final double placeholderSize;
  final Color? placeholderColor;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) => Center(
        child: LoadingAnimationWidget.progressiveDots(
          size: placeholderSize,
          color: placeholderColor ?? ColorsManger.gray,
        ),
      ),
      errorWidget: (context, url, error) =>
          errorWidget ?? const Icon(Icons.error),
    );
  }
}
