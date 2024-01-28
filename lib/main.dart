import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pixelverse/screens/home.dart';
import 'package:pixelverse/state/state.dart';
import 'package:pixelverse/themes/dark_theme.dart';
import 'package:pixelverse/themes/light_theme.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
//instantiate controller for state
  final Controller appState = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        // systemStatusBarContrastEnforced: true,
        systemNavigationBarColor:
            Theme.of(context).colorScheme.secondaryContainer,
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            appState.isDarkTheme.value ? Brightness.dark : Brightness.light));
    return GetMaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode:
            appState.isDarkTheme.value ? ThemeMode.dark : ThemeMode.light,
        // theme: ThemeData(
        //     splashColor: Colors.transparent,
        //     textTheme: GoogleFonts.ralewayTextTheme(
        //       Theme.of(context).textTheme, //font changes
        //     ),
        //     fontFamily: GoogleFonts.raleway().fontFamily),
        debugShowCheckedModeBanner: false,
        home: Home()
        // body: const <Widget>[
        //   Home(),
        //   Collections(),
        //   Settings()
        // ][currentPageIndex]),

        // home: BottomNavBar(),
        );
  }
}
