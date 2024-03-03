import 'package:astra/api/services.dart';
import 'package:astra/components/imgcard.dart';
import 'package:astra/constants/colors.dart';
import 'package:astra/state/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var searchRes = [];
  final Controller controller = Get.find();
  final textController = TextEditingController();

  Future search(query) async {
    var res = await searchWalls(
        query: query,
        isFamilyFilter: controller.isFamilyFilter.value.toString());
    // inspect(searchRes);
    setState(() {
      searchRes = res.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                // color: Theme.of(context).colorScheme.secondaryContainer,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search',
                      style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600)),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white60),
                            borderRadius: BorderRadius.circular(40)),
                        child: TextField(
                            controller: textController,
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) {
                              search(value);
                            },
                            style: GoogleFonts.raleway(
                                textStyle: const TextStyle(
                              fontSize: 18,
                            )),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: const Icon(Icons.search),
                              hintText: 'search wallpapers',
                              hintStyle: GoogleFonts.raleway(
                                  textStyle: const TextStyle(fontSize: 18)),
                            ))),
                    textController.text.isNotEmpty && searchRes.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Center(
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
                            ))
                        : GridView.builder(
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: MediaQuery.of(context)
                                      .size
                                      .width /
                                  (MediaQuery.of(context).size.height / 1.2),
                            ),
                            shrinkWrap: true,
                            itemCount: searchRes.length,
                            itemBuilder: (context, index) {
                              return ImgCard(
                                info: searchRes[index],
                                index: index,
                                heroKeyStr: 'search',
                              );
                            })
                  ],
                ))));
  }
}
