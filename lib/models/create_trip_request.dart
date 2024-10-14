class CreateTripRequest {
  CreateTripRequest({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory CreateTripRequest.fromJson(Map<String, dynamic> json) {
    return CreateTripRequest(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
