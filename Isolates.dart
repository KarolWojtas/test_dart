import 'dart:isolate';

import 'package:meta/meta.dart';

main(List<String> args) async {
  SendPort myIsolateSendPort;
  // setup receive port of main isolate and pass the send port of it to my isolate
  ReceivePort receivePort = ReceivePort();
  Isolate myIsolate = await Isolate.spawn(callback, receivePort.sendPort);

// await reference to sendport to my isolate
  myIsolateSendPort = await receivePort.first;

  Message returnedMessage =
      await sendMessage(myIsolateSendPort, Message(message: 'my message'));
  print('Main Isolate returned $returnedMessage');
  myIsolate.kill();
}

// This is the custom isolate
void callback(SendPort callerSendPort) {
  ReceivePort isolateReceivePort = ReceivePort(); // handshake
  callerSendPort.send(isolateReceivePort.sendPort); // handshake

  isolateReceivePort.listen((dynamic message) {
    print('Received message');
    CrossIsolatesMessage crossMessage = message as CrossIsolatesMessage;
    Message payload = crossMessage.message as Message;
    crossMessage.sender.send(Message(
        message: 'Processed by my isolate ${payload.message}',
        timestamp: DateTime.now()));
  });
}

Future<dynamic> sendMessage(SendPort sendPort, Message message) {
  ReceivePort messageReceivePort = ReceivePort();
  sendPort.send(CrossIsolatesMessage(
      sender: messageReceivePort.sendPort, message: message));
  return messageReceivePort.first;
}

class CrossIsolatesMessage<T> {
  final SendPort sender;
  final T message;
  CrossIsolatesMessage({@required this.sender, this.message});
}

class Message {
  String message;
  DateTime timestamp;
  Message({@required this.message, this.timestamp});
  @override
  String toString() => 'Text: $message, timestamp: $timestamp';
}
