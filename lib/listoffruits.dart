import 'package:amazon/listandgridview.dart';
import 'package:flutter/material.dart';

import 'orange.dart';
class listoff extends StatefulWidget {
  const listoff({super.key});

  @override
  State<listoff> createState() => _listoffState();
}

class _listoffState extends State<listoff> {
  List<Products>productList=[
    Products(image: "apple.png",price: 200, name: "apple"),
    Products(image: "banna.png", price: 100, name: "banna"),
    Products(image: "orange.png", price: 120, name: "orange"),
    Products(image: "carrot.png", price: 70, name: "carrot"),
    Products(image: "mango.png", price: 130, name: "mango"),
    Products(image: "orange.png", price: 150, name: "orange"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fruits shope")
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 200,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("apple.png"),fit: BoxFit.fill),),
            ),
            SizedBox(height: 10,),
            Container(
              height: 200,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("banna.png"),fit: BoxFit.fill),),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("carrot.png"),fit: BoxFit.fill)),
            ),
            SizedBox(height: 10,),
            Container(
              height: 400,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("mango.png"))),
            ),
            SizedBox(height: 10,),
            Container(
              height: 200,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("carrot.png"))),
            ),
            SizedBox(height: 10,),
            Container(
              height: 400,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("fruitspp.png"))),
            ),
            SizedBox(height: 0.2,),
            Container(
              height: 400,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("sr.png"))),
            )
          ],
        ),
      )

    );
  }
}
