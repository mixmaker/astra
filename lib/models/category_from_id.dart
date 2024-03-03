import 'package:astra/models/wall.dart';

class CategoryFromId {
  CategoryFromId({
    required this.respone,
    required this.message,
    required this.count,
    required this.wallpapers,
  });

  final int? respone;
  final String? message;
  final int? count;
  final List<Wall> wallpapers;

  factory CategoryFromId.fromJson(Map<String, dynamic> json) {
    return CategoryFromId(
      respone: json["Respone"],
      message: json["Message"],
      count: json["Count"],
      wallpapers: json["Wallpapers"] == null
          ? []
          : List<Wall>.from(json["Wallpapers"]!.map((x) => Wall.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "Respone": respone,
        "Message": message,
        "Count": count,
        "Wallpapers": wallpapers.map((x) => x.toJson()).toList(),
      };
}
