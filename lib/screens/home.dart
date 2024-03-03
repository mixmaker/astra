import 'package:astra/models/wall.dart';
import 'package:astra/screens/random.dart';
import 'package:flutter/material.dart';
import 'package:astra/screens/categories.dart';
import 'package:astra/screens/featured.dart';
import 'package:astra/screens/settings.dart';
import 'package:astra/api/services.dart';
import 'package:astra/models/categories_model.dart';
import 'package:collection/collection.dart';
import 'package:astra/state/state.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;
  final Controller controller = Get.find();
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    onInit();
    super.initState();
  }

  onInit() async {
    //featured walls
    var data = await getFeaturedWalls(
        isFamilyFilter: controller.isFamilyFilter.value.toString());
    controller.updateFeatured(data ?? <Wall>[]);
    //random walls
    var randomData = await randomWalls(
        isFamilyFilter: controller.isFamilyFilter.value.toString());
    controller.updateRandom(randomData ?? <Wall>[]);
    //latest walls
    var latestData = await latestWalls(
        isFamilyFilter: controller.isFamilyFilter.value.toString());
    controller.updateLatest(latestData ?? <Wall>[]);
    //popular walls
    var popularData = await popularWalls(
        isFamilyFilter: controller.isFamilyFilter.value.toString());
    controller.updatePopular(popularData ?? <Wall>[]);
    //categories
    var categoriesData = await getAllCategories(
        isFamilyFilter: controller.isFamilyFilter.value.toString());
    final result =
        groupBy(categoriesData.data, (Category category) => category.type);
    controller.updateCasual(result['casual'] ?? <Category>[]);
    controller.updateColor(result['color'] ?? <Category>[]);
    controller.updateStock(result['stock'] ?? <Category>[]);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(context,
        controller: _controller,
        popActionScreens: PopActionScreensType.once,
        backgroundColor: Theme.of(context).colorScheme.surface,
        navBarStyle: NavBarStyle.style12,
        // stateManagement: false,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        items: [
          PersistentBottomNavBarItem(
            // activeIcon: Icon(
            //   Icons.explore,
            // ),
            icon: Icon(Icons.explore_outlined),
            title: 'Home',
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary:
                Theme.of(context).colorScheme.secondaryContainer,
            // tooltip: 'Home',
          ),
          PersistentBottomNavBarItem(
            // activeIcon: Icon(Icons.shuffle),
            icon: Icon(Icons.shuffle),
            title: 'RandomWalls',
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary:
                Theme.of(context).colorScheme.secondaryContainer,
            // tooltip: 'RandomWalls',
          ),
          PersistentBottomNavBarItem(
            // activeIcon: Icon(Icons.subscriptions),
            icon: Icon(Icons.subscriptions_outlined),
            title: 'Categories',
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary:
                Theme.of(context).colorScheme.secondaryContainer,
            // tooltip: 'Collections',
          ),
          PersistentBottomNavBarItem(
            // activeIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            title: 'Settings',
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary:
                Theme.of(context).colorScheme.secondaryContainer,
            // tooltip: 'Settings'),
          )
        ],
        screens: <Widget>[
          const Featured(),
          RandomWallsPage(),
          CategoriesScreen(),
          const Settings(),
        ]);
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // backgroundColor: Theme.of(context).colorScheme.background,
//         // appBar: AppBar(
//         //   title: Column(
//         //     children: [
//         //       Text('Curated',
//         //           style: GoogleFonts.raleway(
//         //               textStyle: TextStyle(
//         //                   fontSize: 28, fontWeight: FontWeight.w600))),
//         //       Text(
//         //         ' just for you',
//         //         style: GoogleFonts.raleway(
//         //             textStyle: TextStyle(
//         //                 color: Colors.grey.shade700,
//         //                 fontSize: 14,
//         //                 height: 0.8,
//         //                 fontWeight: FontWeight.w400)),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         bottomNavigationBar: AnimationLimiter(
//           child: BottomNavigationBar(
//             enableFeedback: true,
//             type: BottomNavigationBarType.fixed,
//             items: const <BottomNavigationBarItem>[
              // BottomNavigationBarItem(
              //   activeIcon: Icon(
              //     Icons.explore,
              //   ),
              //   icon: Icon(Icons.explore_outlined),
              //   label: 'Home',
              //   tooltip: 'Home',
              // ),
              // BottomNavigationBarItem(
              //   activeIcon: Icon(Icons.shuffle),
              //   icon: Icon(Icons.shuffle),
              //   label: 'RandomWalls',
              //   tooltip: 'RandomWalls',
              // ),
              // BottomNavigationBarItem(
              //   activeIcon: Icon(Icons.subscriptions),
              //   icon: Icon(Icons.subscriptions_outlined),
              //   label: 'Collections',
              //   tooltip: 'Collections',
              // ),
              // BottomNavigationBarItem(
              //     activeIcon: Icon(Icons.settings),
              //     icon: Icon(Icons.settings_outlined),
              //     label: 'Settings',
              //     tooltip: 'Settings'),
//             ],
//             currentIndex: currentPageIndex,
//             selectedItemColor: Theme.of(context).colorScheme.primary,
//             unselectedItemColor:
//                 Theme.of(context).colorScheme.secondaryContainer,
//             showUnselectedLabels: false,
//             showSelectedLabels: false,
//             elevation: 0,
//             iconSize: 25,
//             // backgroundColor: Color.fromARGB(255, 0, 0, 0),
//             onTap: (int index) {
//               setState(() {
//                 currentPageIndex = index;
//               });
//             },
//           ),
//         ),
//         body: PageTransitionSwitcher(
//             child: [
              // const Featured(),
              // RandomWallsPage(),
              // CategoriesScreen(),
              // const Settings(),
//             ][currentPageIndex],
//             // duration: Duration(milliseconds: 375),
//             transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
//                 FadeTransition(
//                   opacity: Tween<double>(
//                     begin: 1,
//                     end: 0,
//                   ).animate(secondaryAnimation),
//                   child: ScaleTransition(
//                     scale: Tween<double>(
//                       begin: 1,
//                       end: 0.9,
//                     ).animate(secondaryAnimation),
//                     child: FadeTransition(
//                       opacity: Tween<double>(
//                         begin: 0,
//                         end: 1,
//                       ).animate(primaryAnimation),
//                       child: ScaleTransition(
//                         scale: Tween<double>(
//                           begin: 0.9,
//                           end: 1.0,
//                         ).animate(primaryAnimation),
//                         child: child,
//                       ),
//                     ),
//                   ),
//                 )));
//   }
// }
