import 'package:flutter/material.dart';

class NetworkImageModel extends StatelessWidget {
  final String imageUrl;
  final BlendMode colorBlendMode;
  final Color color;
  final BorderRadius borderRadius;

  NetworkImageModel({
    this.color,
    this.colorBlendMode,
    this.imageUrl,
    this.borderRadius = const BorderRadius.horizontal(left: Radius.circular(0)),
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        colorBlendMode: colorBlendMode,
        color: color,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Align(
            alignment: Alignment.bottomCenter,
            child: LinearProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      ),
    );
  }
}
