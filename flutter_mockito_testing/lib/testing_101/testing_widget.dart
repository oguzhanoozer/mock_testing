import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _myText = "Hello";
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          Text(_myText),
          TextField(controller: _controller),
          ElevatedButton(
              onPressed: () {
                _myText = _controller.text;
              },
              child: Text("Change Texts"))
        ],
      )),
    );
  }
}
