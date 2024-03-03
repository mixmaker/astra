import 'package:astra/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:astra/api/services.dart';
import 'package:astra/state/state.dart';
import '../components/imgcard.dart';

class CategoryPage extends StatefulWidget {
  final String name;
  final String type; //Popular or Recent, default is popular

  const CategoryPage({super.key, required this.name, required this.type});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  ScrollController _scrollController = ScrollController();
  var categoryData;
  final Controller appState = Get.find();
  Future<void> _onRefresh() async {
    setState(() {
      categoryData = null;
    });
    initfn();
  }

  @override
  void initState() {
    initfn();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  initfn() async {
    var res = await getWallsFromId(category: widget.name);
    setState(() {
      categoryData = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          // padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            // color: Colors.grey.shade300
          ),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_sharp)),
        ),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.name,
            style: GoogleFonts.raleway(
                textStyle:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          ),
          Text(
            categoryData != null ? '${categoryData.count} walls' : 'Loading...',
            style: GoogleFonts.raleway(
                textStyle: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondaryContainer
                        .withAlpha(200),
                    fontSize: 12,
                    height: 0.7,
                    fontWeight: FontWeight.w400)),
          ),
        ]),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Container(
            margin: EdgeInsets.only(top: 0, left: 20, right: 20),
            child: categoryData == null
                ? Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
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
                  )
                : GridView.builder(
                    padding: EdgeInsets.only(top: 20),
                    // cacheExtent: MediaQuery.of(context).size.width,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.2),
                    ),
                    shrinkWrap: true,
                    itemCount: categoryData.wallpapers.length,
                    itemBuilder: (context, index) {
                      return ImgCard(
                        info: categoryData.wallpapers[index],
                        index: index,
                        heroKeyStr: 'categoryPage',
                      );
                    })),
      ),
    );
    // return CupertinoPageScaffold(
    //   navigationBar: CupertinoNavigationBar(
    //       backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
    //       leading: GestureDetector(
    //           onTap: () => Navigator.pop(context),
    //           child: const Icon(
    //             Icons.arrow_back_ios_new_rounded,
    //             size: 20,
    //           )),
    //       middle: Text(widget.colTitle,
    //           style: GoogleFonts.raleway(
    //               textStyle: TextStyle(
    //                   color: Theme.of(context).colorScheme.onSecondaryContainer,
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.w600)))),
    //   child: Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 20),
    //       // color: Colors.grey[50],
    //       height: 1000,
    //       child: Center(
    //         child: Padding(
    //             padding: const EdgeInsets.only(top: 18, left: 4, right: 4),
    //             child: AnimationLimiter(
    //                 child: GetBuilder<Controller>(builder: ((state) {
    //               if (state.futureCollectionFromId.value == null) {
    //                 return const CircularProgressIndicator();
    //               } else {
    //                 return GridView.builder(
    //                     controller: _scrollController,
    //                     physics: const BouncingScrollPhysics(),
    //                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                       crossAxisCount: 2,
    //                       childAspectRatio: MediaQuery.of(context).size.width /
    //                           (MediaQuery.of(context).size.height / 1.4),
    //                     ),
    //                     itemCount:
    //                         state.futureCollectionFromId.value?.media.length,
    //                     scrollDirection: Axis.vertical,
    //                     shrinkWrap: true,
    //                     itemBuilder: (context, index) {
    //                       return AnimationConfiguration.staggeredList(
    //                         position: index,
    //                         duration: const Duration(milliseconds: 375),
    //                         child: ScaleAnimation(
    //                           scale: 0.8,
    //                           curve: Curves.easeOut,
    //                           child: FadeInAnimation(
    //                             delay: const Duration(milliseconds: 100),
    //                             child: Padding(
    //                               padding: const EdgeInsets.all(4),
    //                               child: ImgCard(
    //                                   photo: state.futureCollectionFromId.value!
    //                                       .media[index],
    //                                   index: index),
    //                             ),
    //                           ),
    //                         ),
    //                       );
    //                     });
    //               }
    //             })))),
    //       )),
    // );
  }
}
