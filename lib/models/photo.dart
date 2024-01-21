import 'package:pixelverse/models/src.dart';

class Photo {
  Photo({
    this.type,
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  final String? type;
  final int id;
  final int width;
  final int height;
  final String? url;
  final String photographer;
  final String? photographerUrl;
  final int? photographerId;
  final String avgColor;
  final Src src;
  final bool? liked;
  final String? alt;

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      type: json['type'],
      id: json["id"],
      width: json["width"],
      height: json["height"],
      url: json["url"],
      photographer: json["photographer"],
      photographerUrl: json["photographer_url"],
      photographerId: json["photographer_id"],
      avgColor: json["avg_color"],
      src: Src.fromJson(json["src"]),
      liked: json["liked"],
      alt: json["alt"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "photographer": photographer,
        "photographer_url": photographerUrl,
        "photographer_id": photographerId,
        "avg_color": avgColor,
        "src": src.toJson(),
        "liked": liked,
        "alt": alt,
      };
}
