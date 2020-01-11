class Bikeinfo {
  final String name;
  final String rider;

  Bikeinfo(this.name, this.rider);

  Bikeinfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        rider = json['rider'];
}
