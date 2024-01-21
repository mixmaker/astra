import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pixelverse/components/imgcard.dart';
import 'package:pixelverse/state/state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  final Controller appState = Get.find();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      appState.loadMoreCurated(
          scrollController: _scrollController,
          page: appState.futureCurated.value!.page + 1);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        'Curated',
                        style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w600)),
                      ),
                      Text(
                        ' just for you',
                        style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 14,
                                height: 0.9,
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 46,
                child: AnimationConfiguration.synchronized(
                  duration: const Duration(milliseconds: 400),
                  child: ScaleAnimation(
                    scale: 0.5,
                    curve: Curves.easeInOut,
                    child: TextField(
                      style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.grey)),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.all(0),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            size: 20,
                            color: Colors.grey[600],
                          ),
                          hintText: 'Search wallpapers',
                          hintStyle: GoogleFonts.raleway(
                              textStyle: TextStyle(color: Colors.grey[600])),
                          fillColor: Colors.lightBlue[50],
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(40)),
                          filled: true),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 4, right: 4),
                child: GetBuilder<Controller>(
                    builder: (state) => AnimatedSwitcher(
                          duration: const Duration(milliseconds: 375),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                              scale: animation,
                              child: child,
                            );
                          },
                          child: state.futureCurated.value != null
                              ? MasonryGridView.builder(
                                  // controller: _scrollController,
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate:
                                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemCount:
                                      state.futureCurated.value?.photos.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => ImgCard(
                                      photo: state
                                          .futureCurated.value!.photos[index],
                                      index: index),
                                )
                              : const Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
