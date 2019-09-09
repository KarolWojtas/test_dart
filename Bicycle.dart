import 'dart:convert';

class Bicycle {
  int cadence;
  int gear;
  int _speed = 0;

  int get speed => _speed;

  Bicycle(this.cadence, this.gear);

  @override
  String toString() => "Cadence: $cadence, gear: $gear speed: $speed";

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }

  Bicycle.fromJson(Map<String, dynamic> json)
      : cadence = json['cadence'],
        gear = json['gear'],
        _speed = json['speed'];

  Map<String, dynamic> toJSON() =>
      {'cadence': cadence, 'gear': gear, 'speed': speed};
}

main(List<String> args) {
  var bicycle = Bicycle(2, 3);
  print(bicycle.toString());
  String bicycleString = """{
    "gear": 2,
    "speed": 3,
    "cadence": 5
  }""";
  print(Bicycle.fromJson(jsonDecode(bicycleString)));
}
