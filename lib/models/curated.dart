import 'photo.dart';

class Curated {
  Curated({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
    required this.nextPage,
  });

  int page;
  final int perPage;
  List<Photo> photos;
  final int totalResults;
  String? nextPage;

  factory Curated.fromJson(Map<String, dynamic> json) {
    return Curated(
      page: json["page"],
      perPage: json["per_page"],
      photos: json["photos"] == null
          ? []
          : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
      totalResults: json["total_results"],
      nextPage: json["next_page"],
    );
  }

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "photos": photos.map((x) => x.toJson()).toList(),
        "total_results": totalResults,
        "next_page": nextPage,
      };
}
