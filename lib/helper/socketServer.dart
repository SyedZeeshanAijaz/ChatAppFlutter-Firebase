import 'dart:io';

void main() async {
  final serverSocket = await ServerSocket.bind('127.0.0.1', 3000);
  print('Server started on port ${serverSocket.port}');

  await for (var socket in serverSocket) {
    handleConnection(socket);
  }
}

void handleConnection(Socket socket) {
  print('Client connected from ${socket.remoteAddress}:${socket.remotePort}');

  socket.listen((List<int> data) {
    final message = String.fromCharCodes(data).trim();
    print('Received message: $message');
    socket.write('You said: $message\n');
  }, onError: (error) {
    print('Error: $error');
    socket.close();
  }, onDone: () {
    print('Client disconnected');
    socket.close();
  });
}
