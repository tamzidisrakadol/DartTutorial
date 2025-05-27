
void main(){
  UserInfo userInfo = UserInfo("Tamzid","Ahmed");
  userInfo.checkUser1("Elon");

  Event event = Event("PC house");
  event.log("Malware function");


}

mixin UserLogging{

  void log(String message){
      print("Hey $message");
  }

  void checkUser(String name){
    print("Hello super $name");
  }

}


class UserInfo with UserLogging{

  String fname;
  String lName;

  UserInfo(this.fname,this.lName);

  void checkUser1(name){  // can set different name. if name goes same then we have to use override annotation
    super.checkUser(name); //print the mixin method
    print("overide $name $lName"); //print the new method
  }

}

mixin class TimestampLogger{
  DateTime get createdAt => DateTime.now();

  void log(String message) {
    print('${createdAt.toIso8601String()}: $message');
  }
}

class Event with TimestampLogger {
  String name;
  Event(this.name);
}

