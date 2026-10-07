import 'dart:async';

import 'package:amazon/AMAZON2.0.dart';
import 'package:flutter/material.dart';

import 'amazon sign in page.dart';
class splashsri extends StatefulWidget {
  const splashsri({super.key});

  @override
  State<splashsri> createState() => _splashsriState();
}

class _splashsriState extends State<splashsri> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>amazonsingingpage()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("amazon2..png"),
            SizedBox(height: 20,),
            Text("welcom",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
            SizedBox(height: 15,),
            CircularProgressIndicator(color: Colors.lightBlue,),
          ],
        ),
      ),

    );
  }
}
