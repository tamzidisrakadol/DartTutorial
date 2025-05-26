void main() {
  Duck duck = Duck();
  var data = duck.fly();
  print(data);

  // Default constructor
//  Engine engine = Engine();

  //custom constructor
  Engine engine = Engine("Tesla");

  //named constructor
  Point point = Point.namedConstructor();
  print(point.x);


  //Redirecting Constructors
  Vector vector = Vector(10, 2, 32);
  double checkData = vector.y;
  print(checkData);

  Logger logger = Logger("Tamzid");
  Logger logger2 = Logger("Tamzid");
  print(identical(logger, logger2));



}

class CanFly {
  String fly() => 'Flying';
}

class CanSwim{
  void swim() => print('Swimming');
}

/*In Dart, every class automatically defines an interface, even if you don’t explicitly declare it.
So every class is also an interface — this is called an implicit interface.
✅ That means:
You can implement any class as if it were an interface.
You're required to implement all its methods and properties.
*/


class Duck implements CanFly, CanSwim {
  @override
  String fly() {
    return 'Duck flies low';
  }

  @override
  void swim() {
    print('Duck swims well');
  }
}


class Engine{
  String? name; // Nullable by default

  Engine(this.name); //Custom Constructor



}

const double xOrigin = 10.99;
const double yOrigin = 0;

class Point {
  final double x;
  final double y;

  // Sets the x and y instance variables
  // before the constructor body runs.
  Point(this.x, this.y);

  // Named constructor
  Point.namedConstructor() : x = xOrigin, y = yOrigin;
}


//Redirecting Constructors
class Vector {
  double x, y, z;

  Vector(this.x, this.y, this.z);

  // Redirects to main constructor
  Vector.diagonal(double value) : this(value, value, value);
}


//factory constructor
class Logger {
  final String name;
  static final Map<String, Logger> _cache = {};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  Logger._internal(this.name);
}
