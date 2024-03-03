import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:astra/constants/api_const.dart';
import 'package:astra/screens/imageview.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../models/wall.dart';

class ImgCard extends StatelessWidget {
  const ImgCard(
      {super.key,
      required this.info,
      required this.index,
      required this.heroKeyStr});
  final int index;
  final Wall info;
  final String heroKeyStr;
  @override
  Widget build(BuildContext context) {
    final heroKey = '${info.id}+$index+$heroKeyStr';
    return AnimationLimiter(
        child: AnimationConfiguration.staggeredGrid(
            columnCount: 2,
            position: index,
            duration: const Duration(milliseconds: 500),
            child: ScaleAnimation(
                scale: 0.8,
                curve: Curves.easeOut,
                child: FadeInAnimation(
                    delay: const Duration(milliseconds: 80),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: GestureDetector(
                          // splashColor: Colors.transparent,
                          // highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => ImageView(
                                        info: info,
                                        index: index,
                                        heroKey: heroKey)));
                          },
                          child: Hero(
                            tag: heroKey,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  //stops the images from disappering when scroling/going to another page
                                  memCacheHeight: MediaQuery.of(context)
                                      .size
                                      .height
                                      .floor(),
                                  memCacheWidth:
                                      MediaQuery.of(context).size.width.floor(),
                                  imageUrl: getImgUrl(info.thumbUrl)),
                              // child: ProgressiveImage(
                              //   width: 200,
                              //   height: 480,
                              //   fit: BoxFit.cover,
                              //   placeholder: const CachedNetworkImageProvider(
                              //       'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM='),
                              //   thumbnail: NetworkImage(getImgUrl(info.thumbUrl)),
                              //   image: NetworkImage(getImgUrl(info.imgUrl)),
                              // )),
                            ),
                          )),
                    )))));
  }
}
