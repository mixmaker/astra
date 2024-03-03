class Wall {
  Wall({
    required this.id,
    required this.name,
    required this.category,
    required this.thumbUrl,
    required this.imgUrl,
    required this.size,
    required this.tags,
    required this.premium,
    required this.date,
    required this.downloads,
    required this.views,
    required this.restricted,
  });

  String id;
  String name;
  String category;
  String thumbUrl;
  String imgUrl;
  String size;
  String tags;
  String premium;
  DateTime? date;
  String downloads;
  String views;
  String restricted;

  factory Wall.fromJson(Map<String, dynamic> json) {
    return Wall(
      id: json["id"],
      name: json["name"],
      category: json["category"],
      thumbUrl: json["thumbUrl"],
      imgUrl: json["imgUrl"],
      size: json["size"],
      tags: json["tags"],
      premium: json["premium"],
      date: DateTime.tryParse(json["date"] ?? ""),
      downloads: json["downloads"],
      views: json["views"],
      restricted: json["restricted"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "thumbUrl": thumbUrl,
        "imgUrl": imgUrl,
        "size": size,
        "tags": tags,
        "premium": premium,
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "downloads": downloads,
        "views": views,
        "restricted": restricted,
      };
}
