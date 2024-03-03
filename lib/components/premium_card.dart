import 'dart:ui';
import 'package:astra/constants/api_const.dart';
import 'package:astra/constants/colors.dart';
import 'package:astra/screens/premium_page.dart';
import 'package:astra/state/state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class PremiumCard extends StatelessWidget {
  PremiumCard({super.key});
  final Controller controller = Get.find();

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
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => PremiumPage()));
                },
                child: Center(
                  child: Container(
                    width: 320,
                    // height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(getImgUrl(
                                controller.randomWalls().data[4].thumbUrl)))),
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
                                  child: Image.asset(
                                    'assets/icon/icon.png',
                                    fit: BoxFit.cover,
                                    width: 130,
                                  ),
                                ),
                                // Logo(),
                                Text(
                                  'Go Premium',
                                  style: GoogleFonts.raleway(
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Text(
                                  'Enjoy ad-free experience, access to exclusive collections',
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
                      ),
                    ),
                  ),
                ),
              ),
            );
    });
  }
}
