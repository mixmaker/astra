import 'wall.dart';

class ListOfWalls {
  ListOfWalls({
    required this.data,
  });

  List<Wall> data;

  factory ListOfWalls.fromJson(List json) {
    return ListOfWalls(
      data: List<Wall>.from(json.map((x) => Wall.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x.toJson()).toList(),
      };
}
