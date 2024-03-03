import 'package:astra/api/services.dart';
import 'package:astra/constants/colors.dart';
import 'package:astra/models/categories_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:astra/constants/api_const.dart';
import 'package:astra/screens/category_page.dart';
import 'package:astra/state/state.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final Controller controller = Get.find();
  Future<void> _onRefresh() async {
    controller.casualCategories(Categories(data: <Category>[]));
    controller.colorCategories(Categories(data: <Category>[]));
    controller.stockCategories(Categories(data: <Category>[]));

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
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.all(6.0),
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
                minWidth: MediaQuery.of(context).size.width),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AnimationLimiter(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
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
                        'Categories',
                        style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w600)),
                      ),
                      Text(
                        ' stock, colors and categories',
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
              )),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetX<Controller>(builder: (controller) {
                      return controller.stockCategories().data.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(top: 40),
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
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  child: Text(
                                    'Stock',
                                    style: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                                SizedBox(
                                    height: 90,
                                    child: AnimationLimiter(
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemExtent: 90,
                                          shrinkWrap: true,
                                          itemCount: controller
                                              .stockCategories()
                                              .data
                                              .length,
                                          itemBuilder: (context, index) {
                                            final thumbUrl =
                                                getCategoryThumbUrl(controller
                                                    .stockCategories()
                                                    .data[index]
                                                    .thumb);
                                            return AnimationConfiguration
                                                .staggeredList(
                                              position: index,
                                              child: SlideAnimation(
                                                horizontalOffset: 40,
                                                curve: Curves.easeInOut,
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                delay: Duration(
                                                    milliseconds: index * 10),
                                                child: FadeInAnimation(
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      PersistentNavBarNavigator
                                                          .pushNewScreen(
                                                              context,
                                                              screen: CategoryPage(
                                                                  name: controller
                                                                      .stockCategories()
                                                                      .data[
                                                                          index]
                                                                      .name,
                                                                  type:
                                                                      'Popular'),
                                                              withNavBar:
                                                                  false);
                                                      // Navigator.push(
                                                      //     context,
                                                      //     CupertinoPageRoute(
                                                      //         builder: (context) => CategoryPage(
                                                      //             name: controller
                                                      //                 .stockCategories()
                                                      //                 .data[
                                                      //                     index]
                                                      //                 .name,
                                                      //             type:
                                                      //                 'Popular')));
                                                    },
                                                    child: Column(
                                                      children: [
                                                        CircleAvatar(
                                                            radius: 30,
                                                            backgroundImage:
                                                                CachedNetworkImageProvider(
                                                                    thumbUrl)),
                                                        Text(
                                                          controller
                                                              .stockCategories()
                                                              .data[index]
                                                              .name,
                                                          style: GoogleFonts.raleway(
                                                              textStyle: TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .onSecondaryContainer
                                                                      .withAlpha(
                                                                          200),
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                            // return GetX<Controller>(
                                            //   init: Controller(),
                                            //   builder: (Controller controller) {
                                            //     return ImgCard(
                                            //         info: controller
                                            //             .featuredWalls()
                                            //             .data[index],
                                            //         index: index);
                                            //   },
                                            // );
                                          }),
                                    ))
                              ],
                            );
                    }),
                    GetX<Controller>(builder: (controller) {
                      return controller.colorCategories().data.isEmpty
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30,
                                        left: 20,
                                        right: 20,
                                        bottom: 10),
                                    child: Text(
                                      'Color',
                                      style: GoogleFonts.raleway(
                                          textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      child: AnimationLimiter(
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemExtent: 80,
                                            shrinkWrap: true,
                                            itemCount: controller
                                                .colorCategories()
                                                .data
                                                .length,
                                            itemBuilder: (context, index) {
                                              return AnimationConfiguration
                                                  .staggeredList(
                                                position: index,
                                                child: SlideAnimation(
                                                  curve: Curves.easeInOut,
                                                  horizontalOffset: 30,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  delay: Duration(
                                                      milliseconds: index * 10),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      PersistentNavBarNavigator
                                                          .pushNewScreen(
                                                              context,
                                                              screen: CategoryPage(
                                                                  name: controller
                                                                      .colorCategories()
                                                                      .data[
                                                                          index]
                                                                      .name,
                                                                  type:
                                                                      'Popular'),
                                                              withNavBar:
                                                                  false);
                                                      // Navigator.push(
                                                      //     context,
                                                      //     CupertinoPageRoute(
                                                      //         builder: (context) => CategoryPage(
                                                      //             name: controller
                                                      //                 .colorCategories()
                                                      //                 .data[
                                                      //                     index]
                                                      //                 .name,
                                                      //             type:
                                                      //                 'Popular')));
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              border: Border.all(
                                                                  width: 2,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade600)),
                                                          child: CircleAvatar(
                                                            radius: 25,
                                                            backgroundColor:
                                                                HexColor(controller
                                                                    .colorCategories()
                                                                    .data[index]
                                                                    .thumb),
                                                          ),
                                                        ),
                                                        Text(
                                                          controller
                                                              .colorCategories()
                                                              .data[index]
                                                              .name,
                                                          style: GoogleFonts.raleway(
                                                              textStyle: TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .onSecondaryContainer
                                                                      .withAlpha(
                                                                          200),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                              // return GetX<Controller>(
                                              //   init: Controller(),
                                              //   builder: (Controller controller) {
                                              //     return ImgCard(
                                              //         info: controller
                                              //             .featuredWalls()
                                              //             .data[index],
                                              //         index: index);
                                              //   },
                                              // );
                                            }),
                                      ))
                                ]);
                    }),
                    GetX<Controller>(builder: (controller) {
                      return controller.casualCategories().data.isEmpty
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, left: 20, right: 20, bottom: 10),
                                  child: Text(
                                    'Categories',
                                    style: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: AnimationLimiter(
                                      child: GridView.builder(
                                          padding: EdgeInsets.zero,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio: 180 / 130),
                                          shrinkWrap: true,
                                          itemCount: controller
                                              .casualCategories()
                                              .data
                                              .length,
                                          itemBuilder: (context, index) {
                                            final thumbUrl =
                                                getCategoryThumbUrl(controller
                                                    .casualCategories()
                                                    .data[index]
                                                    .thumb);
                                            return AnimationConfiguration
                                                .staggeredGrid(
                                              columnCount: 2,
                                              position: index,
                                              child: ScaleAnimation(
                                                scale: 0.6,
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    PersistentNavBarNavigator
                                                        .pushNewScreen(context,
                                                            screen: CategoryPage(
                                                                name: controller
                                                                    .casualCategories()
                                                                    .data[index]
                                                                    .name,
                                                                type:
                                                                    'Popular'),
                                                            withNavBar: false);
                                                    // Navigator.push(
                                                    //     context,
                                                    //     CupertinoPageRoute(
                                                    //         builder: (context) => CategoryPage(
                                                    //             name: controller
                                                    //                 .casualCategories()
                                                    //                 .data[index]
                                                    //                 .name,
                                                    //             type:
                                                    //                 'Popular')));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            6.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Stack(
                                                        children: [
                                                          SizedBox(
                                                            width: 180,
                                                            height: 130,
                                                            child:
                                                                CachedNetworkImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    imageUrl:
                                                                        thumbUrl),
                                                          ),
                                                          Positioned(
                                                            bottom: 0,
                                                            left: 0,
                                                            right: 0,
                                                            child: Container(
                                                              height: 50,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      bottom: 4,
                                                                      left: 10,
                                                                      top: 20),
                                                              decoration:
                                                                  const BoxDecoration(
                                                                      gradient: LinearGradient(
                                                                          begin: Alignment
                                                                              .topCenter,
                                                                          end: Alignment
                                                                              .bottomCenter,
                                                                          stops: [
                                                                    0,
                                                                    0.4,
                                                                    0.6,
                                                                    0.9
                                                                  ],
                                                                          colors: [
                                                                    Colors
                                                                        .transparent,
                                                                    Colors
                                                                        .black26,
                                                                    Colors
                                                                        .black45,
                                                                    Colors
                                                                        .black87,
                                                                  ])),
                                                              child: Text(
                                                                controller
                                                                    .casualCategories()
                                                                    .data[index]
                                                                    .name,
                                                                style: GoogleFonts.raleway(
                                                                    textStyle: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w500)),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                            // return GetX<Controller>(
                                            //   init: Controller(),
                                            //   builder: (Controller controller) {
                                            //     return ImgCard(
                                            //         info: controller
                                            //             .featuredWalls()
                                            //             .data[index],
                                            //         index: index);
                                            //   },
                                            // );
                                          }),
                                    )),
                              ],
                            );
                    }),
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
