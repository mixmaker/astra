// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const String BASE_URL = 'titankoders.com';
const String apiStr = '/script/7.0/data';

getImgUrl(String path) {
  return 'https://$BASE_URL/casual/$path';
}

getCategoryThumbUrl(path) {
  return 'https://$BASE_URL/category_img/$path';
}

//convert hex color code to use in flutter
class HexColor extends Color {
  static int _getColor(String hex) {
    String formattedHex = "FF${hex.toUpperCase().replaceAll("#", "")}";
    return int.parse(formattedHex, radix: 16);
  }

  HexColor(final String hex) : super(_getColor(hex));
}
