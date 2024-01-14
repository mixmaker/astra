import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixelverse/screens/collection_page.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Collections extends StatelessWidget {
  const Collections({super.key});
  static Map dm = {
    "page": 1,
    "per_page": 15,
    "collections": [
      {
        "id": "pbr3m9n",
        "title": "Shopping",
        "description": "",
        "private": false,
        "media_count": 50,
        "photos_count": 30,
        "videos_count": 20
      },
      {
        "id": "kudaxhv",
        "title": "Cities",
        "description": "",
        "private": false,
        "media_count": 117,
        "photos_count": 104,
        "videos_count": 13
      },
      {
        "id": "3icvgko",
        "title": "Dark Colours",
        "description": "",
        "private": false,
        "media_count": 138,
        "photos_count": 138,
        "videos_count": 0
      },
      {
        "id": "9ojhxio",
        "title": "Shine Bright Like A Diamond",
        "description": "",
        "private": false,
        "media_count": 51,
        "photos_count": 41,
        "videos_count": 10
      },
      {
        "id": "j5y9dtd",
        "title": "Starry Skies",
        "description": "",
        "private": false,
        "media_count": 48,
        "photos_count": 38,
        "videos_count": 10
      },
      {
        "id": "cw23sdk",
        "title": "Beauty Salons",
        "description": "",
        "private": false,
        "media_count": 22,
        "photos_count": 22,
        "videos_count": 0
      },
      {
        "id": "3mlznrz",
        "title": "Highways",
        "description": "",
        "private": false,
        "media_count": 22,
        "photos_count": 22,
        "videos_count": 0
      },
      {
        "id": "gk5i3tb",
        "title": "Winning",
        "description": "",
        "private": false,
        "media_count": 35,
        "photos_count": 27,
        "videos_count": 8
      },
      {
        "id": "vo8jc5b",
        "title": "Alcohol",
        "description": "",
        "private": false,
        "media_count": 72,
        "photos_count": 57,
        "videos_count": 15
      },
      {
        "id": "e0fifvd",
        "title": "Switzerland",
        "description": "",
        "private": false,
        "media_count": 105,
        "photos_count": 81,
        "videos_count": 24
      },
      {
        "id": "pnuw4om",
        "title": "Ipads",
        "description": "",
        "private": false,
        "media_count": 37,
        "photos_count": 27,
        "videos_count": 10
      },
      {
        "id": "xxutieb",
        "title": "Cheers",
        "description": "",
        "private": false,
        "media_count": 52,
        "photos_count": 41,
        "videos_count": 11
      },
      {
        "id": "8sagg6d",
        "title": "Boxes",
        "description": "",
        "private": false,
        "media_count": 35,
        "photos_count": 29,
        "videos_count": 6
      },
      {
        "id": "oucowur",
        "title": "Transportation",
        "description": "",
        "private": false,
        "media_count": 76,
        "photos_count": 58,
        "videos_count": 18
      },
      {
        "id": "ug7tmza",
        "title": "Mens Fashion",
        "description": "",
        "private": false,
        "media_count": 62,
        "photos_count": 49,
        "videos_count": 13
      }
    ],
    "total_results": 1040,
    "next_page":
        "https://api.pexels.com/v1/collections/featured/?page=2&per_page=15"
  };
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
                      child: widget,
                      duration: Duration(milliseconds: 400),
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
                              color: Colors.grey.shade700,
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
                  child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 75),
                          childAnimationBuilder: (widget) => SlideAnimation(
                                curve: Curves.easeOut,
                                verticalOffset: 20,
                                child: FadeInAnimation(
                                  child: widget,
                                  duration: Duration(milliseconds: 300),
                                  // delay: Duration(milliseconds: 100),
                                ),
                              ),
                          children: dm['collections']
                              .map<Widget>((e) => GestureDetector(
                                    // splashColor: Colors.transparent,
                                    // highlightColor: Colors.transparent,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  CollectionPage(
                                                    colId: e['id'],
                                                    colTitle: e['title'],
                                                  )));
                                    },
                                    child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: NetworkImage(setOfBgs[
                                                  random.nextInt(
                                                      setOfBgs.length)]),
                                              opacity: 0.7,
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
                                                e['title'],
                                                style: GoogleFonts.raleway(
                                                    textStyle: const TextStyle(
                                                  fontSize: 18,
                                                )),
                                              ),
                                              Text(
                                                '${e['photos_count']} walls',
                                                style: GoogleFonts.raleway(
                                                    textStyle: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey.shade800,
                                                )),
                                              ),
                                            ])),
                                  ))
                              .toList())
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
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
