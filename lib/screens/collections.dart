import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixelverse/screens/collection_page.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pixelverse/state/state.dart';

class Collections extends StatelessWidget {
  Collections({super.key});
  final Controller appState = Get.find();

  static List setOfBgs = [
    'https://ik.imagekit.io/shoumik/wallpaperflare.com_wallpaper_kxPPkDkMy.jpg?updatedAt=1704728126676',
    'https://ik.imagekit.io/shoumik/2098167_tlSLSSMEDk.jpg?updatedAt=1704727841898',
    'https://ik.imagekit.io/shoumik/abstract-geometric-wallpaper-polygonal-mosaic-vector-16699844_wHBv_-cG2.jpg?updatedAt=1704727840381',
    'https://ik.imagekit.io/shoumik/color-triangular-abstract-background-vector-22655448_AHSb461kd.jpg?updatedAt=1704727727825',
    'https://ik.imagekit.io/shoumik/9ec7aaf13de820d50378452a61a201da_TUu_b2e1u.jpg?updatedAt=1704727682778'
  ];
  static Random random = Random();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimationLimiter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    curve: Curves.easeOut,
                    horizontalOffset: 20,
                    child: FadeInAnimation(
                      duration: const Duration(milliseconds: 400),
                      child: widget,
                      // delay: Duration(milliseconds: 100),
                    ),
                  ),
                  children: [
                    Text(
                      'Collections',
                      style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600)),
                    ),
                    Text(
                      ' featured',
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer
                                  .withAlpha(200),
                              fontSize: 14,
                              height: 0.9,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ),
            ),
            // ignore: avoid_print
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: AnimationLimiter(
                  child: GetBuilder<Controller>(builder: (controller) {
                return Column(
                    children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 75),
                        childAnimationBuilder: (widget) => SlideAnimation(
                              curve: Curves.easeOut,
                              verticalOffset: 20,
                              child: FadeInAnimation(
                                duration: const Duration(milliseconds: 300),
                                child: widget,
                                // delay: Duration(milliseconds: 100),
                              ),
                            ),
                        children: controller
                            .futureFeaturedColl.value!.collections
                            .map<Widget>((e) {
                          if (e.photosCount > 0) {
                            return GestureDetector(
                              // splashColor: Colors.transparent,
                              // highlightColor: Colors.transparent,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => CollectionPage(
                                              colId: e.id,
                                              colTitle: e.title,
                                            )));
                              },
                              child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(setOfBgs[
                                            random.nextInt(setOfBgs.length)]),
                                        opacity: 0.4,
                                        fit: BoxFit.cover),
                                  ),
                                  alignment: Alignment.center,
                                  height: 100,
                                  width: double.infinity,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          e.title,
                                          style: GoogleFonts.raleway(
                                              textStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimaryContainer
                                                      .withAlpha(200))),
                                        ),
                                        Text(
                                          '${e.photosCount} walls',
                                          style: GoogleFonts.raleway(
                                              textStyle: TextStyle(
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer
                                                .withAlpha(200),
                                          )),
                                        ),
                                      ])),
                            );
                          } else {
                            return Container();
                          }
                        }).toList())
                    // childdren: dm['collections']
                    //     .map<Widget>((e) => GestureDetector(
                    //           // splashColor: Colors.transparent,
                    //           // highlightColor: Colors.transparent,
                    //           onTap: () {
                    //             Navigator.push(
                    //                 context,
                    //                 CupertinoPageRoute(
                    //                     builder: (context) => CollectionPage(
                    //                           colId: e['id'],
                    //                           colTitle: e['title'],
                    //                         )));
                    //           },
                    //           child: Container(
                    //               margin: const EdgeInsets.symmetric(vertical: 8),
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(20),
                    //                 image: DecorationImage(
                    //                     image: NetworkImage(setOfBgs[
                    //                         random.nextInt(setOfBgs.length)]),
                    //                     opacity: 0.7,
                    //                     fit: BoxFit.cover),
                    //               ),
                    //               alignment: Alignment.center,
                    //               height: 100,
                    //               width: double.infinity,
                    //               child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   children: [
                    //                     Text(
                    //                       e['title'],
                    //                       style: GoogleFonts.raleway(
                    //                           textStyle: const TextStyle(
                    //                         fontSize: 18,
                    //                       )),
                    //                     ),
                    //                     Text(
                    //                       '${e['photos_count']} walls',
                    //                       style: GoogleFonts.raleway(
                    //                           textStyle: TextStyle(
                    //                         fontSize: 12,
                    //                         color: Colors.grey.shade800,
                    //                       )),
                    //                     ),
                    //                   ])),
                    //         ))
                    //     .toList()),
                    );
              })),
            ),
          ],
        ),
      ),
    );
  }
}
