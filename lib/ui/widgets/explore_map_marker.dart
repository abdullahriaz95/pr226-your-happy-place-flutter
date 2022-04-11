import 'package:flutter/material.dart';
import 'package:happy_place/api_utils/http_exception.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/image.dart' as image;
import 'package:happy_place/generated_api_code/api_client.swagger.dart';

class ExploreMapMarker extends StatelessWidget {
  final Entry post;
  const ExploreMapMarker(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: () {
        HttpExceptionNotifyUser.showMessage('tapped');
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  if (post.mood?.imageUrl != null )
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: image.Image.network(
                        post.mood?.imageUrl ?? '',
                        height: 100,
                        width: 100,
                        fit: BoxFit.fitWidth,
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
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width / 3, 0.0);
    path.lineTo(size.width / 2, size.height / 3);
    path.lineTo(size.width - size.width / 3, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
