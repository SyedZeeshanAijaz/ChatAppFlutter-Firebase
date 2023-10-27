import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class SocketClient extends StatefulWidget {
  const SocketClient({Key? key}) : super(key: key);

  @override
  _SocketClientState createState() => _SocketClientState();
}

class _SocketClientState extends State<SocketClient> {
  late final Socket _socket;
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    _initSocket();
  }

  Future<void> _initSocket() async {
    try {
      _socket = await Socket.connect('localhost', 1234);
      _socket.listen(_handleData,
          onError: (error) => print('Error: $error'),
          onDone: () => print('Disconnected'));
    } on SocketException catch (e) {
      print('Error connecting to server: $e');
    }
  }

  void _handleData(List<int> data) {
    final message = utf8.decode(data);
    setState(() {
      _messages.add(message);
    });
  }

  void _sendMessage(String message) {
    _socket.write(message);
  }

  @override
  void dispose() {
    _socket.destroy();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Socket Client')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text(_messages[index]));
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter message',
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  _sendMessage(_controller.text);
                  _controller.clear();
                },
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
