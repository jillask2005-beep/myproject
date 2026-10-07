import 'package:flutter/material.dart';
class oranges extends StatefulWidget {
  int indexValue;
  oranges({super.key,required this.indexValue});

  @override
  State<oranges> createState() => _orangesState();
}

class _orangesState extends State<oranges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
      ),
      body: Center(
        child: Text("welcome"),
      ),
    );
  }
}
