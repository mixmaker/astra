import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageView extends StatefulWidget {
  final Map info;
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
  // late final VoidCallback setWallpaperHome;
  // Platform messages are asynchronous, so we initialize in an async method.
  setWallpaperHome(
    String url, {
    required type,
  }) async {
    setState(() {
      _wallpaperUrlHome = 'Loading';
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
      _wallpaperUrlHome = result;
    });
    // return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            )),
        middle: Text('photo by ${widget.info['photographer']}',
            style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () => setWallpaperHome(widget.info['src']['large2x'],
            type: AsyncWallpaper.HOME_SCREEN),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: HexColor(widget.info['avg_color']),
            ),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.easeInOut,
              firstChild: Padding(
                // padding: const EdgeInsets.all(8.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Text(
                  'Set on homescreen',
                  style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
              secondChild: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: SizedBox(
                    height: 25, width: 25, child: CircularProgressIndicator()),
              ),
              crossFadeState: _wallpaperUrlHome == 'Loading'
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              // vsync: this,
              // duration: Duration(milliseconds: 500),
              // curve: Curves.fastOutSlowIn,
            )),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: widget.info['src']['large2x'],
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
