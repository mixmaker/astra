import 'package:astra/api/services.dart';
import 'package:astra/components/latest_card.dart';
import 'package:astra/components/logo.dart';
import 'package:astra/components/premium_card.dart';
import 'package:astra/constants/colors.dart';
import 'package:astra/models/list_of_walls.dart';
import 'package:astra/models/wall.dart';
import 'package:astra/screens/latest_walls.dart';
import 'package:astra/screens/popular_walls.dart';
import 'package:astra/screens/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:astra/components/imgcard.dart';
import 'package:astra/state/state.dart';

class Featured extends StatefulWidget {
  const Featured({super.key});

  @override
  State<Featured> createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  final Controller controller = Get.find();

  Future<void> _onRefresh() async {
    controller.updateFeatured(ListOfWalls(data: <Wall>[]));

    var data = await getFeaturedWalls(
        isFamilyFilter: controller.isFamilyFilter.value.toString());
    controller.updateFeatured(data);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: _onRefresh,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            // color: Theme.of(context).colorScheme.secondaryContainer,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height / 4,
            ),
            child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 30),
                        const SizedBox(height: 80, child: Logo()),
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                              borderRadius: BorderRadius.circular(16)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) => const Search()));
                              },
                              icon: const Icon(Icons.search_rounded)),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: FlutterCarousel(
                        options: CarouselOptions(
                            // autoPlay: true,
                            aspectRatio: 16 / 10,
                            showIndicator: true,
                            slideIndicator: CircularWaveSlideIndicator(),
                            indicatorMargin: 16),
                        items: [
                          PremiumCard(),
                          LatestCard(
                            title: 'Latest walls',
                            desc: 'get the latest wallpapers',
                            icon: Icons.history,
                            page: LatestWallsPage(),
                          ),
                          LatestCard(
                            title: 'Popoular walls',
                            desc: 'catch up on whats trending',
                            icon: Icons.trending_up,
                            page: PopularWallsPage(),
                          ),
                        ],
                        // items: [1, 2, 3, 4, 5].map((i) {
                        //   return Builder(
                        //     builder: (BuildContext context) {
                        //       return Container(
                        //           width: MediaQuery.of(context).size.width,
                        //           margin: EdgeInsets.symmetric(horizontal: 5.0),
                        //           decoration: BoxDecoration(color: Colors.amber),
                        //           child: Text(
                        //             'text $i',
                        //             style: TextStyle(fontSize: 16.0),
                        //           ));
                        //     },
                        //   );
                        // }).toList(),
                      ),
                    ),
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
                              'Featured',
                              style: GoogleFonts.raleway(
                                  textStyle: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Text(
                              ' just for you',
                              style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                      // color: Colors.grey.shade700,
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
                    GetX<Controller>(builder: (controller) {
                      return Container(
                          constraints: BoxConstraints(
                              minHeight:
                                  MediaQuery.of(context).size.height / 4),
                          child: controller.featuredWalls().data.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Center(
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: LoadingIndicator(
                                        indicatorType:
                                            Indicator.lineSpinFadeLoader,
                                        colors: krainbow,
                                        // colors: [
                                        //   Colors.deepPurple,
                                        //   Colors.purple,
                                        //   Colors.purpleAccent,
                                        // ],
                                      ),
                                    ),
                                  ))
                              : GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            1.2),
                                  ),
                                  shrinkWrap: true,
                                  itemCount:
                                      controller.featuredWalls().data.length,
                                  itemBuilder: (context, index) {
                                    return ImgCard(
                                      info: controller
                                          .featuredWalls()
                                          .data[index],
                                      index: index,
                                      heroKeyStr: 'featured',
                                    );
                                  }));
                    }),
                  ],
                ))),
      ),
    ));
  }
}
