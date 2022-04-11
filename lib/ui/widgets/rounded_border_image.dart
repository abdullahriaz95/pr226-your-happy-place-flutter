import 'package:flutter/material.dart';

class RoundedBorderBoxImage extends StatelessWidget {
  final double size;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final String? profileUrl;
  const RoundedBorderBoxImage({
    Key? key,
    required this.size,
    required this.borderRadius,
    this.borderColor = Colors.white,
    this.borderWidth = 4.0,
    required this.profileUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius - 4),
        child: profileUrl == null
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  'assets/images/ph_profile_image.png',
                ),
              )
            : Image.network(
                profileUrl!,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder:
                    (BuildContext context, Object exception, stackTrace) {
                  return Image.asset(
                    'assets/images/ph_profile_image.png',
                  );
                },
              ),
      ),
    );
  }
}
