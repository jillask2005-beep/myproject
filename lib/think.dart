import 'package:flutter/material.dart';
class think extends StatefulWidget {
  int indexValue;
  think({super.key,required this.indexValue});

  @override
  State<think> createState() => _thinkState();
}

class _thinkState extends State<think> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("welcome"),
      ),
      body: Center(
        child: Text("think"),
      ),
    );
  }
}
