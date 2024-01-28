import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progressive_image/progressive_image.dart';
import '../models/photo.dart';

class ImageView extends StatefulWidget {
  final Photo info;
  const ImageView({super.key, required this.info});

  @override
  State<ImageView> createState() => _ImageViewState();
}

//convert hex color code to use in flutter
class HexColor extends Color {
  static int _getColor(String hex) {
    String formattedHex = "FF${hex.toUpperCase().replaceAll("#", "")}";
    return int.parse(formattedHex, radix: 16);
  }

  HexColor(final String hex) : super(_getColor(hex));
}

class _ImageViewState extends State<ImageView> {
  late bool goToHome;
  String _wallpaperUrlHome = 'Unknown';
  String _wallpaperUrlLock = 'Unknown';
  // late final VoidCallback setWallpaperHome;
  // Platform messages are asynchronous, so we initialize in an async method.
  setWallpaperHome(
    String url, {
    required type,
  }) async {
    setState(() {
      if (type == AsyncWallpaper.HOME_SCREEN) {
        _wallpaperUrlHome = 'Loading';
      }
      if (type == AsyncWallpaper.LOCK_SCREEN) {
        _wallpaperUrlLock = 'Loading';
      }
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
      if (type == AsyncWallpaper.HOME_SCREEN) {
        _wallpaperUrlHome = result;
      }
      if (type == AsyncWallpaper.LOCK_SCREEN) {
        _wallpaperUrlLock = result;
      }
    });
    // return null;
  }

  @override
  Widget build(BuildContext context) {
    var textColor = HexColor(widget.info.avgColor).computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CupertinoNavigationBar(
        backgroundColor: HexColor(widget.info.avgColor), //statusbar issue
        // backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: textColor,
            )),
        middle: Text('photo by ${widget.info.photographer}',
            style: GoogleFonts.raleway(
                textStyle: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => setWallpaperHome(widget.info.src.large2X,
                type: AsyncWallpaper.LOCK_SCREEN),
            child: Container(
                margin: const EdgeInsets.only(left: 0.5),
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(18)),
                  color: HexColor(widget.info.avgColor),
                ),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 250),
                  firstCurve: Curves.easeInOut,
                  secondCurve: Curves.easeInOut,
                  firstChild: Padding(
                    // padding: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Text(
                      'Set on lockscreen',
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: textColor)),
                    ),
                  ),
                  secondChild: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: SizedBox(
                        height: 23,
                        width: 23,
                        child: CircularProgressIndicator(color: textColor)),
                  ),
                  crossFadeState: _wallpaperUrlLock == 'Loading'
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  // vsync: this,
                  // duration: Duration(milliseconds: 500),
                  // curve: Curves.fastOutSlowIn,
                )),
          ),
          // Spacer(),
          GestureDetector(
            onTap: () => setWallpaperHome(widget.info.src.large2X,
                type: AsyncWallpaper.HOME_SCREEN),
            child: Container(
                margin: const EdgeInsets.only(left: 0.5),
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.horizontal(right: Radius.circular(18)),
                  color: HexColor(widget.info.avgColor),
                ),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 250),
                  firstCurve: Curves.easeInOut,
                  secondCurve: Curves.easeInOut,
                  firstChild: Padding(
                    // padding: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Text(
                      'Set on homescreen',
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: textColor)),
                    ),
                  ),
                  secondChild: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: SizedBox(
                        height: 23,
                        width: 23,
                        child: CircularProgressIndicator(
                          color: textColor,
                        )),
                  ),
                  crossFadeState: _wallpaperUrlHome == 'Loading'
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  // vsync: this,
                  // duration: Duration(milliseconds: 500),
                  // curve: Curves.fastOutSlowIn,
                )),
          ),
        ],
      ),
      body: Center(
          child: AspectRatio(
        aspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.4),
        child: ProgressiveImage(
          width: widget.info.width.toDouble(),
          height: widget.info.height.toDouble(),
          fit: BoxFit.cover,
          placeholder: const CachedNetworkImageProvider(
              'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM='),
          thumbnail: NetworkImage(widget.info.src.tiny),
          image: NetworkImage(widget.info.src.large2X),
        ),
      )),
    );
  }
}
