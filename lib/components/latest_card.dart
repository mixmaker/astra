import 'dart:math';
import 'dart:ui';
import 'package:astra/constants/api_const.dart';
import 'package:astra/constants/colors.dart';
import 'package:astra/state/state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class LatestCard extends StatelessWidget {
  LatestCard(
      {super.key,
      required this.title,
      required this.desc,
      required this.icon,
      required this.page});
  final String title;
  final String desc;
  final IconData icon;
  final Widget page;
  final Controller controller = Get.find();

  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<Controller>(builder: (controller) {
      return controller.randomWalls().data.isEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: LoadingIndicator(
                    indicatorType: Indicator.lineSpinFadeLoader,
                    colors: krainbow,
                    // colors: [
                    //   Colors.deepPurple,
                    //   Colors.purple,
                    //   Colors.purpleAccent,
                    // ],
                  ),
                ),
              ))
          : Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 40, left: 10, right: 0),
              child: InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(context,
                      screen: page, withNavBar: false);
                  // Navigator.push(
                  //     context, CupertinoPageRoute(builder: (context) => page));
                },
                child: Container(
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.amber,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(getImgUrl(
                                controller
                                    .randomWalls()
                                    .data[random(0, 20)]
                                    .thumbUrl)))),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                            color: Theme.of(context)
                                .colorScheme
                                .background
                                .withOpacity(0.7),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 100,
                                      height: 60,
                                      child: Icon(
                                        icon,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer
                                            .withAlpha(200),
                                        size: 35,
                                      )),
                                  // Logo(),
                                  Text(
                                    title,
                                    style: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Text(
                                    desc,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer
                                                .withAlpha(200),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))),
              ));
    });
  }
}
