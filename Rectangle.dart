import 'dart:math';

class Rectangle {
  Point origin;
  int width;
  int height;

  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});
  @override
  String toString() =>
      'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}

main(List<String> args) {
  print(Rectangle(width: 20, height: 20));
  print(Rectangle(origin: Point(2, 2)));
}
