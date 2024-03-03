import 'package:astra/api/services.dart';
import 'package:astra/components/imgcard.dart';
import 'package:astra/constants/colors.dart';
import 'package:astra/models/list_of_walls.dart';
import 'package:astra/models/wall.dart';
import 'package:astra/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class PopularWallsPage extends StatelessWidget {
  PopularWallsPage({super.key});
  final Controller controller = Get.find();

  Future<void> _onRefresh() async {
    controller.updatePopular(ListOfWalls(data: <Wall>[]));
    var popularData = await popularWalls(
        isFamilyFilter: controller.isFamilyFilter.value.toString());
    controller.updatePopular(popularData ?? <Wall>[]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            onRefresh: _onRefresh,
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  padding: const EdgeInsets.all(6.0),
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                      minWidth: MediaQuery.of(context).size.width),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimationLimiter(
                            child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back_ios)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:
                                        AnimationConfiguration.toStaggeredList(
                                      duration:
                                          const Duration(milliseconds: 375),
                                      childAnimationBuilder: (widget) =>
                                          SlideAnimation(
                                        curve: Curves.easeOut,
                                        horizontalOffset: 20,
                                        child: FadeInAnimation(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          child: widget,
                                          // delay: Duration(milliseconds: 100),
                                        ),
                                      ),
                                      children: [
                                        Text(
                                          'Popular',
                                          style: GoogleFonts.raleway(
                                              textStyle: const TextStyle(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        Text(
                                          ' trending wallpapers',
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
                              ]),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 20, right: 20),
                          child: GetX<Controller>(builder: (controller) {
                            return Container(
                                constraints: BoxConstraints(
                                    minHeight:
                                        MediaQuery.of(context).size.height -
                                            200),
                                child: controller.popularWalls().data.isEmpty
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
                                        padding: EdgeInsets.zero,
                                        physics: const BouncingScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio:
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.2),
                                        ),
                                        shrinkWrap: true,
                                        itemCount: controller
                                            .popularWalls()
                                            .data
                                            .length,
                                        itemBuilder: (context, index) {
                                          return ImgCard(
                                            info: controller
                                                .popularWalls()
                                                .data[index],
                                            index: index,
                                            heroKeyStr: 'popular',
                                          );
                                        }));
                          }),
                        )
                      ]),
                ))));
  }
}
