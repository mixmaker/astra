class Categories {
  Categories({
    required this.data,
  });

  final List<Category> data;

  factory Categories.fromJson(List json) {
    return Categories(
      data: List<Category>.from(json.map((x) => Category.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.thumb,
    required this.type,
  });

  final String id;
  final String name;
  final String thumb;
  final String type;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"],
      thumb: json["thumb"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "thumb": thumb,
        "type": type,
      };
}
