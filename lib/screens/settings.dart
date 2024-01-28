import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixelverse/screens/settings/about_page.dart';
import 'package:pixelverse/screens/settings/appearance_settings.dart';
import 'package:pixelverse/screens/settings/data_usage_settings.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      padding: const EdgeInsets.all(6.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  'Settings',
                  style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.w600)),
                ),
                Text(
                  ' make it yours',
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  curve: Curves.easeOut,
                  horizontalOffset: 40,
                  child: FadeInAnimation(
                    duration: const Duration(milliseconds: 400),
                    child: widget,
                    // delay: Duration(milliseconds: 100),
                  ),
                ),
                children: [
                  SettingsCard(
                      title: 'Appearance',
                      subtitle: 'tweak the look & feel of the app',
                      screen: AppearanceSettings()),
                  SettingsCard(
                    title: 'Data usage',
                    subtitle: 'modify the quality of images',
                    screen: DataUsageSettings(),
                  ),
                  SettingsCard(
                    title: 'About',
                    subtitle: 'info about the app & developer',
                    screen: About(),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget screen;
  const SettingsCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.screen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => Navigator.push(
            context, CupertinoPageRoute(builder: (context) => screen)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer
                              .withAlpha(200),
                          fontSize: 14,
                          height: 1.3,
                          fontWeight: FontWeight.w400)),
                )
              ],
            ),
            const Icon(Icons.keyboard_arrow_right_rounded)
          ],
        ),
      ),
    );
  }
}
