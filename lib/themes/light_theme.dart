import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  // // scaffoldBackgroundColor: Theme.of(context).colorScheme.background,
  splashColor: Colors.transparent,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  // useMaterial3: true,
  // colorScheme: lightColorScheme,
  // pageTransitionsTheme: const PageTransitionsTheme(builders: {
  //   TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  // }),
);
