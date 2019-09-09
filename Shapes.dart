import 'dart:math';

abstract class Shape {
  num get area;
  // factory constructor
  factory Shape(String type) {
    switch (type) {
      case 'circle':
        return Circle(2);
      case 'squre':
        return Square(2);
      default:
        return Circle(2);
    }
  }
  @override
  String toString() => "Area: $area";
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}

// every class creates interface
class CircleMock implements Circle {
  num area;
  num radius;
}

// top level factory method
Shape shapeFactory(String type) {
  switch (type) {
    case 'circle':
      return Circle(2);
    case 'squre':
      return Square(2);
    default:
      return Circle(2);
  }
}

main(List<String> args) {
  print(Circle(10).area);
  var circle2 = shapeFactory('circle');
  print(circle2.area);
  var circle3 = Shape('circle');
  print(circle3.area);
}
