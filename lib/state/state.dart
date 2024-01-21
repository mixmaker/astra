import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixelverse/models/collection_from_id.dart';
import 'package:pixelverse/models/curated.dart';
import 'package:http/http.dart' as http;
import 'package:pixelverse/models/featured_collections.dart';

class Controller extends GetxController {
  var futureCurated = Rxn<Curated>();
  var futureFeaturedColl = Rxn<FeaturedCollections>();
  var futureCollectionFromId = Rxn<CollectionfromId>();
  RxBool isLightTheme = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    futureCurated.value = await getCuratedPhotos(page: 1);
    futureFeaturedColl.value = await getFeaturedCollections();
    update();
  }

  Future<void> initColFromId({required String id, required int page}) async {
    CollectionfromId result = await getCollectionfromId(id: id, page: page);
    futureCollectionFromId.value = result;
    update();
  }

  // setCurated(data) => {futureCurated.value = data, update()};
  void loadMoreCurated(
      {required ScrollController scrollController, required int page}) async {
    // inspect(appState.futureCurated.value);
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      Curated result = await getCuratedPhotos(page: page);
      futureCurated.value?.photos.addAll(result.photos);
      futureCurated.value?.page = result.page;
      futureCurated.value?.nextPage = result.nextPage;
      update();
    }
  }

  void loadMoreColFromId(
      {required ScrollController scrollController,
      required String id,
      required int page}) async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      CollectionfromId result = await getCollectionfromId(id: id, page: page);
      futureCollectionFromId.value?.media.addAll(result.media);
      futureCollectionFromId.value?.page = result.page;
      futureCollectionFromId.value?.nextPage = result.nextPage;
      update();
    }
  }
}

Future getCuratedPhotos({required int page}) async {
  final response = await http.get(
      Uri.parse('https://api.pexels.com/v1/curated?per_page=25&page=$page'),
      headers: {
        "Authorization":
            "563492ad6f91700001000001483cce7cc55d42279bd98f44bf282a0c"
      });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Curated.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load curated');
  }
}

Future getFeaturedCollections() async {
  final response = await http.get(
      Uri.parse('https://api.pexels.com/v1/collections/featured'),
      headers: {
        "Authorization":
            "563492ad6f91700001000001483cce7cc55d42279bd98f44bf282a0c"
      });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return FeaturedCollections.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load curated');
  }
}

Future getCollectionfromId({required String id, required int page}) async {
  final response = await http.get(
      Uri.parse('https://api.pexels.com/v1/collections/$id?page=$page'),
      headers: {
        "Authorization":
            "563492ad6f91700001000001483cce7cc55d42279bd98f44bf282a0c"
      });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CollectionfromId.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
    // if (collection == null) {
    //   setState(() {
    //     collection = result;
    //   });
    // } else if (collection!.page > 1) {
    //   setState(() {
    // collection?.media.addAll(result.media);
    // collection?.nextPage = result.nextPage;
    // collection?.page = result.page;
    //   });
    //   inspect(collection);
    // }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load curated');
  }
}
