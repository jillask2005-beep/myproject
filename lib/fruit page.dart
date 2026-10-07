import 'package:flutter/material.dart';
class fruit extends StatefulWidget {
  int indexValue;
  fruit({super.key,required this.indexValue});

  @override
  State<fruit> createState() => _fruitState();
}

class _fruitState extends State<fruit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Text("fruit page"),
      ),
    );
  }
}
