import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:astra/constants/api_const.dart';
import 'package:astra/models/categories_model.dart';
import 'package:astra/models/category_from_id.dart';
import 'package:astra/models/list_of_walls.dart';

Future getFeaturedWalls({required String isFamilyFilter}) async {
  var url = Uri.https(BASE_URL, '$apiStr/FeaturedWallpapers.php',
      {'isFamilyFilter': isFamilyFilter, 'offset': '0'});
  var response = await http.get(url);
  // print(response.body);
  if (response.statusCode == 200) {
    return ListOfWalls.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(
        'Failed to load Featured Wallpapers : error ${response.statusCode}');
  }
}

Future getAllCategories({required String isFamilyFilter}) async {
  var url = Uri.https(
      BASE_URL, '$apiStr/Categories.php', {'isFamilyFilter': isFamilyFilter});
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return Categories.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Categories : error ${response.statusCode}');
  }
}

Future getWallsFromId(
    {required String category, String type = 'Popular'}) async {
  var url = Uri.https(BASE_URL, '$apiStr/CategoryWallpapers.php',
      {'category': category, 'type': type, 'offset': '0'});
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return CategoryFromId.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load wallpapers : error ${response.statusCode}');
  }
}

Future searchWalls(
    {required String query, required String isFamilyFilter}) async {
  var url = Uri.https(BASE_URL, '$apiStr/SearchWallpapers.php',
      {'query': query, 'isFamilyFilter': isFamilyFilter, 'offset': '0'});
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return ListOfWalls.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load wallpapers : error ${response.statusCode}');
  }
}

Future randomWalls({required String isFamilyFilter}) async {
  var url = Uri.https(BASE_URL, '$apiStr/RandomWallpapers.php',
      {'isFamilyFilter': isFamilyFilter});
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return ListOfWalls.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Categories : error ${response.statusCode}');
  }
}

Future latestWalls({required String isFamilyFilter}) async {
  var url = Uri.https(BASE_URL, '$apiStr/LatestWallpapers.php',
      {'isFamilyFilter': isFamilyFilter, 'offset': '0'});
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return ListOfWalls.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Categories : error ${response.statusCode}');
  }
}

Future popularWalls({required String isFamilyFilter}) async {
  var url = Uri.https(BASE_URL, '$apiStr/PopularWallpapers.php',
      {'isFamilyFilter': isFamilyFilter, 'offset': '0', 'filter': 'views'});
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return ListOfWalls.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Categories : error ${response.statusCode}');
  }
}
