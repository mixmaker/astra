import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixelverse/screens/collections.dart';
import 'package:pixelverse/screens/home.dart';
import 'package:pixelverse/screens/settings.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'components/bottom_nav_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        // systemStatusBarContrastEnforced: true,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
        theme: ThemeData(
          splashColor: Colors.transparent,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
        ),
        // theme: ThemeData(
        //     textTheme: GoogleFonts.ralewayTextTheme(
        //       Theme.of(context).textTheme, //font changes
        //     ),
        //     fontFamily: GoogleFonts.raleway().fontFamily),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            // appBar: AppBar(
            //   title: Column(
            //     children: [
            //       Text('Curated',
            //           style:
            //               TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
            //       Text(
            //         ' just for you',
            //         style: GoogleFonts.raleway(
            //             textStyle: TextStyle(
            //                 color: Colors.grey.shade700,
            //                 fontSize: 14,
            //                 height: 0.8,
            //                 fontWeight: FontWeight.w400)),
            //       ),
            //     ],
            //   ),
            // ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.explore,
                  ),
                  icon: Icon(Icons.explore_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.subscriptions),
                  icon: Icon(Icons.subscriptions_outlined),
                  label: 'Collections',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.settings),
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
              ],
              currentIndex: currentPageIndex,
              selectedItemColor: Colors.lightBlue[300],
              showUnselectedLabels: false,
              showSelectedLabels: false,
              elevation: 0,
              iconSize: 25,
              backgroundColor: Colors.white,
              onTap: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
            ),
            body: PageTransitionSwitcher(
                child: [Home(), Collections(), Settings()][currentPageIndex],
                // duration: Duration(milliseconds: 375),
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) =>
                        FadeTransition(
                          opacity: Tween<double>(
                            begin: 1,
                            end: 0,
                          ).animate(secondaryAnimation),
                          child: ScaleTransition(
                            scale: Tween<double>(
                              begin: 1,
                              end: 0.9,
                            ).animate(secondaryAnimation),
                            child: FadeTransition(
                              opacity: Tween<double>(
                                begin: 0,
                                end: 1,
                              ).animate(primaryAnimation),
                              child: ScaleTransition(
                                scale: Tween<double>(
                                  begin: 0.9,
                                  end: 1.0,
                                ).animate(primaryAnimation),
                                child: child,
                              ),
                            ),
                          ),
                        )))
        // body: const <Widget>[
        //   Home(),
        //   Collections(),
        //   Settings()
        // ][currentPageIndex]),

        // home: BottomNavBar(),
        );
  }
}
