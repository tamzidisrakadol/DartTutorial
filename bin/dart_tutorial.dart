import 'package:dart_tutorial/dart_tutorial.dart' as dart_tutorial;

void main() {
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
