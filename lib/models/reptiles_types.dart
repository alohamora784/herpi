class ReptileType {
  final int id;
  final String name;
  final String image;

  ReptileType({
    required this.id,
    required this.name,
    required this.image,
  });

  factory ReptileType.fromjson(json) {
    return ReptileType(
      id: json["id"],
      name: json["name"],
      image: json["image"],
    );
  }
}
