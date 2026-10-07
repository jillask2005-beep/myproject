 import 'package:amazon/instagrampagesri.dart';
 import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
 class socialmedia extends StatefulWidget {
   const socialmedia({super.key});

   @override

   State<socialmedia> createState() => _socialmediaState();
 }

class _socialmediaState extends State<socialmedia> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset("assets/video3.mp4")
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

   Widget build(BuildContext context) {
     return DefaultTabController(length: 6,
     child:  Scaffold(
       appBar: AppBar(
         actions: [
           //
           Row(
             children: [
               Icon(Icons.smart_display,),
               Text("youtube",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,),),
               SizedBox(
                 width: 220,
               ),
               Icon(Icons.notifications),
               SizedBox(width: 10,),
               Icon(Icons.search),
             ],
           ),
         ],
       ),
     body:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 280,width: double.infinity,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("madhangowri.png"),fit: BoxFit.cover)),
              ),
              SizedBox(height: 10,),
              Container(
                height: 280,width: double.infinity,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("ttf.png"),fit: BoxFit.cover)),
              ),
              SizedBox(height: 0.2,),
              Container(
                height: 280,width: double.infinity,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("missi.png"))),
              ),
              SizedBox(height: 10,),
              Container(
              child: _controller .value.isInitialized?AspectRatio(aspectRatio: _controller .value.aspectRatio,
              child: VideoPlayer(_controller),)
                  :Center(
                child: CircularProgressIndicator(),
              ),


              ),
              IconButton(icon: Icon(_controller.value.isPlaying?Icons.pause:Icons.play_arrow,size: 40,),
                onPressed: (){
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                  }
                );
                }
              ),

            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.ondemand_video),label: "shorts"),
            BottomNavigationBarItem(icon: Icon(Icons.plus_one),label: "add"),
            BottomNavigationBarItem(icon: Icon(Icons.subscriptions),label: "subscription"),
            BottomNavigationBarItem(icon: Icon(Icons.person_pin),label: "person"),
          ],
        ),

    )

     );
        }
 }
