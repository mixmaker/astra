import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({super.key});

  //launch external browser
  launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  ClipRect(
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset('assets/icon/iconwt.png', width: 180),
                  ),
                  // CircleAvatar(
                  //   radius: 50,
                  //   child: ClipOval(
                  //       child: Image.asset(
                  //     'assets/icon/icon.png',
                  //     scale: 0.3,
                  //   )),
                  // ),
                  // Text('pixelverse',
                  //     style: GoogleFonts.raleway(
                  //         textStyle: const TextStyle(
                  //             fontSize: 28, fontWeight: FontWeight.w600))),
                  Text('0.1',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                              fontWeight: FontWeight.w500))),
                ],
              ),
              Column(
                children: [
                  Text(
                      'An open source wallpaper app made with flutter using the pexels api.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                              fontWeight: FontWeight.w600))),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0, top: 10),
                    child: InkWell(
                      onTap: () => launchURL(Uri.parse('https://pexels.com')),
                      child: Image.network(
                          'https://images.pexels.com/lib/api/pexels.png',
                          height: 35),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text('If you liked my work, show some love and ⭐ the repo',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                              fontWeight: FontWeight.w600))),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => launchURL(Uri.parse(
                              'https://www.buymeacoffee.com/shoumik')),
                          child: Image.network(
                            'https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png',
                            height: 40,
                          ),
                        ),
                        InkWell(
                          onTap: () => launchURL(Uri.parse(
                              'https://github.com/mixmaker/pixelverse')),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 1,
                                )),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  // clipBehavior: Clip.hardEdge,
                                  child: Image.network(
                                    'https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png',
                                    height: 38,
                                  ),
                                ),
                                Text('Visit on Github ',
                                    style: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text('A project by Shoumik Kumbhakar',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600))),
            ],
          ),
        ),
      ),
    );
  }
}
