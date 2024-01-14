import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixelverse/screens/imageview.dart';

class ImgCard extends StatelessWidget {
  final Map<String, dynamic> info;
  const ImgCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,

      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ImageView(
                      info: info,
                    )));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: CachedNetworkImage(
          imageUrl: info['src']['medium'],
          fit: BoxFit.cover,
          placeholder: (context, url) => const SizedBox(
              height: 50,
              width: 50,
              child: Center(child: CircularProgressIndicator())),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
