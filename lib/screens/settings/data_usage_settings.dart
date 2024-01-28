import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataUsageSettings extends StatefulWidget {
  const DataUsageSettings({super.key});

  @override
  State<DataUsageSettings> createState() => _DataUsageSettingsState();
}

bool dataSaver = true;

class _DataUsageSettingsState extends State<DataUsageSettings> {
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
        middle: Text('Data Usage Settings',
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
                    'Data Saver',
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ),
                  Text(
                    'reduces quality of images to save data',
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
              Switch(
                  value: dataSaver,
                  onChanged: (bool value) {
                    setState(() {
                      dataSaver = value;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
