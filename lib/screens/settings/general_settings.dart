import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:astra/state/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralSettings extends StatelessWidget {
  GeneralSettings({super.key});

  final Controller appState = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            )),
        middle: Text('General Settings',
            style: GoogleFonts.raleway(
                textStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 20,
                    fontWeight: FontWeight.w600))),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          // height: 59,
          // color: Colors.amber,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Dark Mode',
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          'experimental dark mode feature',
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  height: 0.9,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer
                                      .withAlpha(200),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                        )
                      ],
                    ),
                    GetBuilder<Controller>(builder: (state) {
                      return Switch(
                          value: state.isDarkTheme.value,
                          // value: false,
                          onChanged: (bool value) {
                            // print(value);
                            state.changeTheme(value);
                            // Get.changeTheme(ThemeData.dark());
                            // Get.changeThemeMode(state.isDarkTheme.value
                            //     ? ThemeMode.light
                            //     : ThemeMode.dark);
                          });
                    })
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Family Filter*',
                        style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                      Text(
                        '*experimental, may break things',
                        style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                                height: 0.9,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer
                                    .withAlpha(200),
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                  GetX<Controller>(builder: (state) {
                    return Switch(
                        value: state.isFamilyFilter.value,
                        // value: false,
                        onChanged: (bool value) async {
                          // print(value);
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool('isFamilyFilter', value);
                          state.isFamilyFilter(value);
                          // Get.changeTheme(ThemeData.dark());
                          // Get.changeThemeMode(state.isDarkTheme.value
                          //     ? ThemeMode.light
                          //     : ThemeMode.dark);
                        });
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
