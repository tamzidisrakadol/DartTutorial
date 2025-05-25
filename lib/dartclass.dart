void main() {
  Duck duck = Duck();
  var data = duck.fly();
  print(data);
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
