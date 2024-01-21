import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixelverse/state/state.dart';

class AppearanceSettings extends StatefulWidget {
  const AppearanceSettings({super.key});

  @override
  State<AppearanceSettings> createState() => _AppearanceSettingsState();
}

final Controller appState = Get.find();

class _AppearanceSettingsState extends State<AppearanceSettings> {
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
        middle: Text('Appearance Settings',
            style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600))),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          height: 59,
          // color: Colors.amber,
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
                            color: Colors.grey.shade700,
                            fontSize: 12,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              GetBuilder<Controller>(builder: (state) {
                return Switch(
                    value: state.isLightTheme.value,
                    onChanged: (bool value) {
                      state.isLightTheme.value = value;
                      Get.changeThemeMode(state.isLightTheme.value
                          ? ThemeMode.light
                          : ThemeMode.dark);
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
