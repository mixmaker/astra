import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixelverse/state/state.dart';
import '../components/imgcard.dart';

class CollectionPage extends StatefulWidget {
  final String colId;
  final String colTitle;

  const CollectionPage(
      {super.key, required this.colId, required this.colTitle});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  ScrollController _scrollController = ScrollController();

  final Controller appState = Get.find();

  @override
  void initState() {
    super.initState();
    appState.initColFromId(id: widget.colId, page: 1);
    _scrollController.addListener(() {
      appState.loadMoreColFromId(
          id: widget.colId,
          scrollController: _scrollController,
          page: appState.futureCollectionFromId.value!.page + 1);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
    appState.futureCollectionFromId.value = null;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          backgroundColor:
              CupertinoColors.extraLightBackgroundGray.withOpacity(0.5),
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
              )),
          middle: Text(widget.colTitle,
              style: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600)))),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.grey[50],
          height: 1000,
          child: Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 18, left: 4, right: 4),
                child: AnimationLimiter(
                    child: GetBuilder<Controller>(builder: ((state) {
                  if (state.futureCollectionFromId.value == null) {
                    return const CircularProgressIndicator();
                  } else {
                    return MasonryGridView.builder(
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount:
                            state.futureCollectionFromId.value?.media.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: ScaleAnimation(
                              scale: 0.8,
                              curve: Curves.easeOut,
                              child: FadeInAnimation(
                                delay: const Duration(milliseconds: 100),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: ImgCard(
                                      photo: state.futureCollectionFromId.value!
                                          .media[index],
                                      index: index),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                })))),
          )),
    );
  }
}
