class Weather {
  final String name;
  final double point;
  final double distance;

  Weather({
    required this.name,
    required this.point,
    required this.distance,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'],
      point: json['point'],
      distance: json['distance'],
    );
  }
}
