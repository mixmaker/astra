import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pixelverse/screens/collections.dart';
import 'package:pixelverse/screens/curated.dart';
import 'package:pixelverse/screens/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.background,
        // appBar: AppBar(
        //   title: Column(
        //     children: [
        //       Text('Curated',
        //           style: GoogleFonts.raleway(
        //               textStyle: TextStyle(
        //                   fontSize: 28, fontWeight: FontWeight.w600))),
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
              tooltip: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.subscriptions),
              icon: Icon(Icons.subscriptions_outlined),
              label: 'Collections',
              tooltip: 'Collections',
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.settings),
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
                tooltip: 'Settings'),
          ],
          currentIndex: currentPageIndex,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          iconSize: 25,
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          onTap: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
        body: PageTransitionSwitcher(
            child: [
              const Curated(),
              Collections(),
              const Settings()
            ][currentPageIndex],
            // duration: Duration(milliseconds: 375),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
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
                )));
  }
}
