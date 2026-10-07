import 'dart:async';
import 'package:flutter/material.dart';
import 'instagram.dart';
import 'listandgridview.dart';
//import 'package:srikanth_projects/tabbar1.dart';
class Splashscreen extends StatefulWidget {
   Splashscreen({super.key, });

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState()
  {
    super.initState();
    Timer(const Duration(seconds: 5),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>const insta(),

      ),
      );

    });
  }  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("instalog.png"),
            SizedBox(height: 20,),
            Text("welcome",style: TextStyle(color: Colors.yellow,fontSize: 15,fontStyle: FontStyle.italic),),
            SizedBox(height: 20,),
            CircularProgressIndicator(color: Colors.white,)
          ],
        ),
      ),
    );
  }
}