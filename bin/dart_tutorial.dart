import 'dart:core';

import 'package:dart_tutorial/dart_tutorial.dart' as dart_tutorial;

void main() async {
  //records
  (int, String) person = (1, "Adol");

  print(person.$2); //Positional fields (accessed by index)

  ({int age, String name}) userInfo = (age: 25, name: "Tamzid"); //Named fields

  print(userInfo.name); // Named fields (accessed by name):

  var data = swap((2, 3));
  print(data);

  //list
  var list = [1, 2, 3];
  list.add(12);

  List<int>? nullTestList;
  List<int> mergedList2 = [
    ...list,
    ...nullTestList ?? [13, 14, 15],
  ]; //similar to ?: operator
  List<int> mergedList = [0, ...?nullTestList];
  print(mergedList2);

  int? absentValue = null;
  int? presentValue = 3;
  var items = [
    1,
    ?absentValue, // for null mark it will not print
    ?presentValue,
    absentValue, //for not null mark it will print null
    5,
  ];

  print(items);


  //dart type system
  Object name = "Alice"; // Static type: Object | Runtime type: String
  print(name.runtimeType); // Output: String

  //Type Inference
  var numList = [1, 2, 3]; // Inferred as `List<int>`
  final fname = "Bob";    // Inferred as `String`

  //Null Safety
  String lname = "Alice"; // Non-nullable
  String? nickname = null; // Nullable

  //Type Hierarchy & Subtyping
  dynamic anything = 42; // Opts out of type safety
  anything = "Now a string"; // No compile-time error (but risky!)

  //Type Checking & Casting
  /*is → Checks type at runtime.

  as → Casts (throws if wrong).

  runtimeType → Gets the runtime type.*/

  await for (var page in fetchPages(3)) {
  print('Fetched Page: $page');
  }

  List<String> fakeFile = [
  "First line",
  "Second line",
  "Third line"
  ];

  for (var line in readLines(fakeFile)) {
  print("Read: $line");
  }

  var details = greetUser();
  print(details("Hello", "Adol"));

}

//RECORD as return type and record as parameter
(int, int) swap((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

List<String> buildCommandLine(
  String executable,
  List<String> options,
    [List<String>? extraOptions,] //optional parameter
    ) {
  return [
    executable,
    ...options,
    ...?extraOptions, // <-- OK now.
  ];
}

//function with optional parameter using []
String greet(String name, [String? title]) {
  return title != null ? "Hello, $title $name!" : "Hello, $name!";
}

//named parameter using required
void printUser({required String name, int age = 18}) {
  print("Name: $name, Age: $age");
}

//function with default value
void log({String message = "No message"}) {
  print(message);
}

//Higher-Order Functions
void operate(Function(int, int) action) {
  print(action(10, 5)); // Calls the passed function
}

//operate((a, b) => a + b); // Output: 15

//Generics in function
T first<T>(List<T> list) => list[0];

//Generator async function
Stream<List<String>> fetchPages(int totalPages) async* {
  for (int i = 1; i <= totalPages; i++) {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    yield List.generate(3, (j) => "Item Page $i - ${j + 1}");
  }
}

//Generator sync function
Iterable<String> readLines(List<String> fileLines) sync* {
  for (var line in fileLines) {
    yield line;
  }
}

// sync
int add(int a, int b) {
  return a + b;
}

// sync*
Iterable<int> numbers() sync* {
  yield 1;
  yield 2;
  yield 3;
}

// async
Future<String> getData() async {
  await Future.delayed(Duration(seconds: 1));
  return "Data";
}

// async*
Stream<int> counter() async* {
  for (int i = 0; i < 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

Iterable<int> numbersSync() sync* {
  yield 1;
  yield 2;
}

Iterable<int> allNumbers() sync* {
  yield 0;
  yield* numbers(); // yields 1 and 2 from the `numbers()` generator
  yield 3;
}

// Function Returning Another Function
Function makeMultiplier(int factor) {
  return (int x) => x * factor;
}

int addition(int a, int b) {
  return a + b;
}
int Function(int, int) operation=addition;

String typeCheck(String b, String c){
  return "$b $c";
}

String Function(String, String) greetUser(){
  return typeCheck ;
}