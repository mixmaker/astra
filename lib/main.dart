import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astra/screens/home.dart';
import 'package:astra/state/state.dart';
import 'package:astra/themes/dark_theme.dart';
import 'package:astra/themes/light_theme.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  //   statusBarIconBrightness: Brightness.dark,
  //   systemNavigationBarColor: Colors.transparent,
  // ));
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
//instantiate controller for state
  final Controller appState = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode:
            appState.isDarkTheme.value ? ThemeMode.dark : ThemeMode.light,
        // theme: lightTheme.copyWith(
        //   splashColor: Colors.transparent,
        //   pageTransitionsTheme: const PageTransitionsTheme(
        //     builders: <TargetPlatform, PageTransitionsBuilder>{
        //       TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        //       TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        //     },
        //   ),
        //     textTheme: GoogleFonts.ralewayTextTheme(
        //       Theme.of(context).textTheme, //font changes
        //     ),
        //     fontFamily: GoogleFonts.raleway().fontFamily),
        // ),
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
