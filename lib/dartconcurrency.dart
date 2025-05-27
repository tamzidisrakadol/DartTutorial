import 'dart:async';
import 'dart:isolate';

void main() async {
  final user = await fetchUser();
 // print(user); // 'Alice' after 1 second


  await for (final num in countStream(3)) {
  //  print(num);  // 0, 1, 2 (1-second intervals)
  }


//Example 1
  // ReceivePort receivePort = ReceivePort();
  //
  // // Spawning a new isolate
  // await Isolate.spawn(heavyTask, receivePort.sendPort);
  //
  // // Receiving message
  // receivePort.listen((message) {
  //   print('Received from isolate: $message');
  //   receivePort.close(); // close when done
  // });

//Example 3 (multiple send message)
  // final mainReceivePort = ReceivePort();
  //
  // SendPort? isolateSendPort;
  //
  // // First message will be the isolate's SendPort
  // mainReceivePort.listen((message) {
  //   if (message is SendPort) {
  //     isolateSendPort = message;
  //
  //     // Now send multiple messages
  //     isolateSendPort!.send("Message 1");
  //     isolateSendPort!.send("Message 2");
  //     isolateSendPort!.send("Message 3");
  //   } else {
  //     // Print processed messages
  //     print("Main received: $message");
  //   }
  // });
  //
  // await Isolate.spawn(isolateEntry, mainReceivePort.sendPort);

//Example 2
  final receivePort = ReceivePort();

  // Spawn the isolate
  await Isolate.spawn(countNumbers, receivePort.sendPort);

  // Listen to the stream from the isolate
  receivePort.listen(
        (data) {
      print('Received from Isolate: $data');
    },
    onDone: () {
      print('Stream from isolate is done.');
      receivePort.close();
    },
  );


}

//Asynchronous Programming

//Future and async
Future<String> fetchUser() async {
  await Future.delayed(Duration(seconds: 1)); // Simulate network call
  return 'Alice';
}


//stream and async*
Stream<int> countStream(int max) async* {
  for (int i = 0; i < max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;  // Emit value
  }
}

void heavyTask(SendPort sendPort) {
  int result = 0;
  for (int i = 0; i < 1000000000; i++) {
    result += i;
  }
  sendPort.send(result);
}


/// The entry point for the isolate
/// Isolate function
void countNumbers(SendPort sendPort) async {
  // Send numbers 1 to 5 with 1-second delay
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    sendPort.send(i); // Send number
  }

  // Signal done
  sendPort.send('done');
}

void isolateEntry(SendPort mainSendPort) {
  final isolateReceivePort = ReceivePort();
  mainSendPort.send(isolateReceivePort.sendPort);

  isolateReceivePort.listen((message) {
    print("Isolate received: $message");
    mainSendPort.send("Processed: $message");
  });
}
