import 'package:flutter/material.dart';
class stacksample extends StatefulWidget {
  const stacksample({super.key});

  @override
  State<stacksample> createState() => _stacksampleState();
}

class _stacksampleState extends State<stacksample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  height: 250,
                  width: 250,
                  color: Colors.red,
                ),
                Positioned(child: Text("data"),right: 10,left: 10,top: 100,),
              ],
              
            ),
          )
        ],
      ),
    );
  }
}
