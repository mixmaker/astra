import 'dart:ui';
import 'package:astra/constants/colors.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:astra/constants/api_const.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/wall.dart';

class ImageView extends StatefulWidget {
  const ImageView(
      {super.key,
      required this.info,
      required this.index,
      required this.heroKey});
  final Wall info;
  final int index;
  final String heroKey;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  late bool goToHome;
  // String _wallpaperUrlHome = 'Unknown';
  // String _wallpaperUrlLock = 'Unknown';
  String wallpaperSet = 'Unknown';

  setWallpaper(
    String url, {
    required type,
  }) async {
    setState(() {
      // if (type == AsyncWallpaper.HOME_SCREEN) {
      wallpaperSet = 'Loading';
      // }
      // if (type == AsyncWallpaper.LOCK_SCREEN) {
      //   _wallpaperUrlLock = 'Loading';
      // }
    });
    String result;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await AsyncWallpaper.setWallpaper(
        url: url,
        wallpaperLocation: type,
        goToHome: false,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      )
          ? 'Wallpaper set'
          : 'Failed to get wallpaper.';
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return null;

    setState(() {
      // if (type == AsyncWallpaper.HOME_SCREEN) {
      print(result);
      wallpaperSet = result;
      // }
      // if (type == AsyncWallpaper.LOCK_SCREEN) {
      //   _wallpaperUrlLock = result;
      // }
    });
    // return null;
  }

  @override
  Widget build(BuildContext context) {
    final thumbUrl = getImgUrl(widget.info.thumbUrl);
    final imgUrl = getImgUrl(widget.info.imgUrl);

    // var textColor = HexColor(widget.info.avgColor).computeLuminance() > 0.5
    //     ? Colors.black
    //     : Colors.white;
    return Scaffold(
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 25,
        child: IconButton(
            // color: Colors.amber,
            icon: const Icon(Icons.arrow_upward_rounded, color: Colors.black),
            onPressed: () => showDialog(
                  context: context,
                  builder: (_) => Dialog(
                      backgroundColor: Colors.black87,
                      child: Container(
                          alignment: FractionalOffset.center,
                          height: 180.0,
                          padding: const EdgeInsets.all(20.0),
                          child: Stack(children: [
                            wallpaperSet == 'Loading'
                                ? Center(
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
                                  )
                                : SizedBox(),
                            // : Container(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Set on homescreen',
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16)),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        wallpaperSet = 'Loading';
                                      });
                                      setWallpaper(imgUrl,
                                          type: AsyncWallpaper.HOME_SCREEN);
                                    }),
                                InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Set on lockscreen',
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                    ),
                                  ),
                                  onTap: () => setWallpaper(imgUrl,
                                      type: AsyncWallpaper.LOCK_SCREEN),
                                ),
                                InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Set on both',
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                    ),
                                  ),
                                  onTap: () => setWallpaper(imgUrl,
                                      type: AsyncWallpaper.BOTH_SCREENS),
                                ),
                              ],
                            ),
                          ]))),
                )),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  opacity: 0.9,
                  image: CachedNetworkImageProvider(thumbUrl)),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Center(
                    child: Container(
                  // height: 600,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Stack(children: [
                    Center(
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
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.05),
                        ),
                        child: Hero(
                          tag: widget.heroKey,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: FadeInImage.memoryNetwork(
                              width: MediaQuery.of(context).size.width / 1.4,
                              height: MediaQuery.of(context).size.height / 1.4,
                              fit: BoxFit.cover,
                              placeholder: kTransparentImage,
                              image: imgUrl,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      Colors.black.withAlpha(140),
                      Colors.black.withAlpha(180)
                    ])),
                child: Column(
                  children: [
                    Text(
                      widget.info.category,
                      style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white70)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.file_present_outlined,
                              color: Colors.white54,
                              size: 20,
                            ),
                            Text(
                              widget.info.size.toString(),
                              style: GoogleFonts.raleway(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white54)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.remove_red_eye,
                                color: Colors.white54,
                                size: 20,
                              ),
                              Text(
                                widget.info.views.toString(),
                                style: GoogleFonts.raleway(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white54)),
                              ),
                            ]),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.download,
                                color: Colors.white54,
                                size: 20,
                              ),
                              Text(
                                widget.info.downloads.toString(),
                                style: GoogleFonts.raleway(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white54)),
                              ),
                            ]),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
    // return Scaffold(
    //   backgroundColor: Theme.of(context).colorScheme.background,
    //   appBar: CupertinoNavigationBar(
    //     backgroundColor: HexColor(widget.info.avgColor), //statusbar issue
    //     // backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
    //     leading: GestureDetector(
    //         onTap: () => Navigator.pop(context),
    //         child: Icon(
    //           Icons.arrow_back_ios_new_rounded,
    //           size: 20,
    //           color: textColor,
    //         )),
    //     middle: Text('photo by ${widget.info.photographer}',
    //         style: GoogleFonts.raleway(
    //             textStyle: TextStyle(
    //           color: textColor,
    //           fontSize: 20,
    //           fontWeight: FontWeight.w600,
    //         ))),
    //   ),
    // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    // floatingActionButton: Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     GestureDetector(
    //       onTap: () => setWallpaperHome(widget.info.src.large2X,
    //           type: AsyncWallpaper.LOCK_SCREEN),
    //       child: Container(
    //           margin: const EdgeInsets.only(left: 0.5),
    //           decoration: BoxDecoration(
    //             borderRadius:
    //                 const BorderRadius.horizontal(left: Radius.circular(18)),
    //             color: HexColor(widget.info.avgColor),
    //           ),
    //           child: AnimatedCrossFade(
    //             duration: const Duration(milliseconds: 250),
    //             firstCurve: Curves.easeInOut,
    //             secondCurve: Curves.easeInOut,
    //             firstChild: Padding(
    //               // padding: const EdgeInsets.all(8.0),
    //               padding: const EdgeInsets.symmetric(
    //                   horizontal: 18, vertical: 10),
    //               child: Text(
    //                 'Set on lockscreen',
    //                 style: GoogleFonts.raleway(
    //                     textStyle: TextStyle(
    //                         fontSize: 16,
    //                         fontWeight: FontWeight.w600,
    //                         color: textColor)),
    //               ),
    //             ),
    //             secondChild: Padding(
    //               padding: const EdgeInsets.symmetric(
    //                   horizontal: 18, vertical: 10),
    //               child: SizedBox(
    //                   height: 23,
    //                   width: 23,
    //                   child: CircularProgressIndicator(color: textColor)),
    //             ),
    //             crossFadeState: _wallpaperUrlLock == 'Loading'
    //                 ? CrossFadeState.showSecond
    //                 : CrossFadeState.showFirst,
    //             // vsync: this,
    //             // duration: Duration(milliseconds: 500),
    //             // curve: Curves.fastOutSlowIn,
    //           )),
    //     ),
    //     // Spacer(),
    //     GestureDetector(
    //       onTap: () => setWallpaperHome(widget.info.src.large2X,
    //           type: AsyncWallpaper.HOME_SCREEN),
    //       child: Container(
    //           margin: const EdgeInsets.only(left: 0.5),
    //           decoration: BoxDecoration(
    //             borderRadius:
    //                 const BorderRadius.horizontal(right: Radius.circular(18)),
    //             color: HexColor(widget.info.avgColor),
    //           ),
    //           child: AnimatedCrossFade(
    //             duration: const Duration(milliseconds: 250),
    //             firstCurve: Curves.easeInOut,
    //             secondCurve: Curves.easeInOut,
    //             firstChild: Padding(
    //               // padding: const EdgeInsets.all(8.0),
    //               padding: const EdgeInsets.symmetric(
    //                   horizontal: 18, vertical: 10),
    //               child: Text(
    //                 'Set on homescreen',
    //                 style: GoogleFonts.raleway(
    //                     textStyle: TextStyle(
    //                         fontSize: 16,
    //                         fontWeight: FontWeight.w600,
    //                         color: textColor)),
    //               ),
    //             ),
    //             secondChild: Padding(
    //               padding: const EdgeInsets.symmetric(
    //                   horizontal: 18, vertical: 10),
    //               child: SizedBox(
    //                   height: 23,
    //                   width: 23,
    //                   child: CircularProgressIndicator(
    //                     color: textColor,
    //                   )),
    //             ),
    //             crossFadeState: _wallpaperUrlHome == 'Loading'
    //                 ? CrossFadeState.showSecond
    //                 : CrossFadeState.showFirst,
    //             // vsync: this,
    //             // duration: Duration(milliseconds: 500),
    //             // curve: Curves.fastOutSlowIn,
    //           )),
    //     ),
    //   ],
    // ),
    //   body: Center(
    //       child: AspectRatio(
    //     aspectRatio: MediaQuery.of(context).size.width /
    //         (MediaQuery.of(context).size.height / 1.4),
    //     child: ProgressiveImage(
    //       width: widget.info.width.toDouble(),
    //       height: widget.info.height.toDouble(),
    //       fit: BoxFit.cover,
    //       placeholder: const CachedNetworkImageProvider(
    //           'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM='),
    //       thumbnail: NetworkImage(widget.info.src.tiny),
    //       image: NetworkImage(widget.info.src.large2X),
    //     ),
    //   )),
    // );
  }
}
