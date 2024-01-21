import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:pixelverse/screens/imageview.dart';
import 'package:progressive_image/progressive_image.dart';
import '../models/photo.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ImgCard extends StatelessWidget {
  final Photo photo;
  final int index;
  const ImgCard({super.key, required this.photo, required this.index});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: ScaleAnimation(
                scale: 0.8,
                curve: Curves.easeOut,
                child: FadeInAnimation(
                    delay: const Duration(milliseconds: 100),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: GestureDetector(
                        // splashColor: Colors.transparent,
                        // highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ImageView(
                                        info: photo,
                                      )));
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: ProgressiveImage(
                              width: 200,
                              height: 280,
                              fit: BoxFit.cover,
                              placeholder: const CachedNetworkImageProvider(
                                  'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM='),
                              thumbnail: NetworkImage(photo.src.tiny),
                              image: NetworkImage(photo.src.medium),
                            )),
                      ),
                    )))));
  }
}
