import 'package:flutter/material.dart';
class apple extends StatefulWidget {
  const apple({super.key});

  @override
  State<apple> createState() => _appleState();
}

class _appleState extends State<apple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Column(
        children: [
          Container(
            height: 250,width: double.infinity,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("apple.png"),fit: BoxFit.fill)),
          ),
          Text("Apple-red"),
          SizedBox(height: 20,),
          Container(
            width: 180,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "search",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(child: ElevatedButton(onPressed: (){}, child: Text("Add to CArd",style: TextStyle(color: Colors.black,
                  fontSize: 20,fontWeight: FontWeight.bold),)))
            ],
          )

        ],
      ),
    );
  }
}
