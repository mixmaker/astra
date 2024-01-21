import 'package:pixelverse/models/photo.dart';

class CollectionfromId {
  CollectionfromId({
    required this.page,
    required this.perPage,
    required this.media,
    required this.totalResults,
    required this.nextPage,
    required this.id,
  });

  int page;
  final int perPage;
  List<Photo> media;
  final int totalResults;
  String? nextPage;
  final String id;

  factory CollectionfromId.fromJson(Map<String, dynamic> json) {
    //  List<Photo> filtered= json["media"]
    //     .where((t) => t['type']== 'Photo')
    //     .toList();
    var list = json["media"].where((t) => t['type'] == 'Photo').toList();
    list.map((item) => Photo.fromJson(item)).toList();
    return CollectionfromId(
      page: json["page"],
      perPage: json["per_page"],
      media: json["media"]
          .where((t) => t['type'] == 'Photo')
          .toList()
          .map((item) => Photo.fromJson(item))
          .toList()
          .cast<Photo>(),
      totalResults: json["total_results"],
      nextPage: json["next_page"],
      id: json["id"],
    );
  }
  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "media": media.map((x) => x.toJson()).toList(),
        "total_results": totalResults,
        "next_page": nextPage,
        "id": id,
      };
}
