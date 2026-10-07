import 'package:amazon/youtube.dart';
import 'package:amazon/ytproduct.dart';
import 'package:flutter/material.dart';

class Srchyt extends StatefulWidget {
  const Srchyt({super.key});

  @override
  State<Srchyt> createState() => _SrchytState();
}

class _SrchytState extends State<Srchyt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        title: Container(
          height: 30,
          decoration: BoxDecoration(
            color: Color(0xFFB6B6B6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            style: TextStyle(color: Color(0xFF1A1A1A)),
            cursorColor: Colors.black ,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15,bottom: 10),
              hintText: "Search Youtube",
              hintStyle: TextStyle(fontSize: 14, color: Color(0xFF777777)),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: Expanded(
          child: ListView.builder(
            itemCount: VideoDetails.videos.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Ytproduct(ind: index)));
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 30,
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.history),
                  SizedBox(width: 20,),
                  Text(VideoDetails.videos[index].name!),
                ],
              ),
            ),
          ),
        );
      }
      )
      ),
    );
  }
}
