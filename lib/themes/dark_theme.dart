import 'package:flutter/material.dart';
// import 'package:astra/themes/color_schemes.g.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  // colorScheme: ColorScheme.dark(
  //     background: Colors.black,
  //     // secondaryContainer: Colors.grey,
  //     onSecondaryContainer: Colors.grey),
  splashColor: Colors.transparent,
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: Colors.black38),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  // useMaterial3: true,
  // // colorScheme: darkColorScheme,
  // pageTransitionsTheme: const PageTransitionsTheme(builders: {
  //   TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  // }),
);
