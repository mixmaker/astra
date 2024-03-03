import 'package:astra/models/list_of_walls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astra/models/categories_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/wall.dart';

class Controller extends GetxController {
  final featuredWalls = ListOfWalls(data: <Wall>[]).obs;
  final randomWalls = ListOfWalls(data: <Wall>[]).obs;
  final latestWalls = ListOfWalls(data: <Wall>[]).obs;
  final popularWalls = ListOfWalls(data: <Wall>[]).obs;
  final casualCategories = Categories(data: <Category>[]).obs;
  final colorCategories = Categories(data: <Category>[]).obs;
  final stockCategories = Categories(data: <Category>[]).obs;
  final isDarkTheme = false.obs;
  final isFamilyFilter = true.obs;

  @override
  void onInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final themePref = prefs.getBool('isDarkTheme') ?? false;
    isDarkTheme.value = themePref;
    Get.changeThemeMode(themePref ? ThemeMode.dark : ThemeMode.light);
    final familyFilterPref = prefs.getBool('isFamilyFilter') ?? true;
    isFamilyFilter.value = familyFilterPref;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: themePref ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    ));
    super.onInit();
  }

  void changeTheme(state) async {
    isDarkTheme.value = state;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', state);
    Get.changeThemeMode(state ? ThemeMode.dark : ThemeMode.light);
    update();
  }

  updateFeatured(newVal) {
    featuredWalls(ListOfWalls(data: newVal.data));
  }

  updateCasual(newVal) {
    casualCategories(Categories(data: newVal));
  }

  updateColor(newVal) {
    colorCategories(Categories(data: newVal));
  }

  updateStock(newVal) {
    stockCategories(Categories(data: newVal));
  }

  updateRandom(newVal) {
    randomWalls(ListOfWalls(data: newVal.data));
  }

  updateLatest(newVal) {
    latestWalls(ListOfWalls(data: newVal.data));
  }

  updatePopular(newVal) {
    popularWalls(ListOfWalls(data: newVal.data));
  }
}
