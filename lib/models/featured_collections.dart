class FeaturedCollections {
  FeaturedCollections({
    required this.page,
    required this.perPage,
    required this.collections,
    required this.totalResults,
    required this.nextPage,
  });

  final int? page;
  final int? perPage;
  final List<Collection> collections;
  final int? totalResults;
  final String? nextPage;

  factory FeaturedCollections.fromJson(Map<String, dynamic> json) {
    return FeaturedCollections(
      page: json["page"],
      perPage: json["per_page"],
      collections: json["collections"] == null
          ? []
          : List<Collection>.from(
              json["collections"]!.map((x) => Collection.fromJson(x))),
      totalResults: json["total_results"],
      nextPage: json["next_page"],
    );
  }

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "collections": collections.map((x) => x.toJson()).toList(),
        "total_results": totalResults,
        "next_page": nextPage,
      };
}

class Collection {
  Collection({
    required this.id,
    required this.title,
    required this.description,
    required this.private,
    required this.mediaCount,
    required this.photosCount,
    required this.videosCount,
  });

  final String id;
  final String title;
  final String? description;
  final bool? private;
  final int? mediaCount;
  final int photosCount;
  final int? videosCount;

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      private: json["private"],
      mediaCount: json["media_count"],
      photosCount: json["photos_count"],
      videosCount: json["videos_count"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "private": private,
        "media_count": mediaCount,
        "photos_count": photosCount,
        "videos_count": videosCount,
      };
}
