import 'dart:async';
import 'dart:io';

Future<void> main() async {
  // Create a single-subscription stream from a file
   final file = File('data.txt');
   final stream = file.openRead(); // Returns a single-subscription stream

  // Listen to the stream
   stream.listen(
         (data) => print('Data: ${data.length} bytes'),
     onError: (e) => print('Error: $e'),
     onDone: () => print('File read complete'),
   );

  // Attempting to listen again throws StateError
  // stream.listen((_) {}); // ❌ Throws "Bad state: Stream has already been listened to"


  // Create a broadcast stream controller
  final controller = StreamController<int>.broadcast();

  // First subscriber
  final sub1 = controller.stream.listen(
        (value) => print('Sub1: $value'),
  );

  // Second subscriber
  final sub2 = controller.stream.listen(
        (value) => print('Sub2: ${value * 2}'),
  );

  // Emit events
  controller.add(1);
  controller.add(2);

  // Wait for a brief moment to ensure events are processed
  await Future.delayed(Duration(milliseconds: 100));

  // Clean up
  await sub1.cancel();
  await sub2.cancel();
  await controller.close();
}