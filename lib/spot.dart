import 'package:amazon/Amazon/flipcart.dart';
import 'package:flutter/material.dart';

import 'insta.dart';
class Spot extends StatefulWidget {
  const Spot({super.key});

  @override
  State<Spot> createState() => _SpotState();
}

class _SpotState extends State<Spot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 440,
            backgroundColor: Colors.black,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ),
            title: Text(
              "Obama's Playlist💦💦",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.deepPurple,
                      Colors.black,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 60,
                    left: 20,
                    right: 20,
                    bottom: 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/uk.jpeg",
                            height: 170,
                            width: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "Obama's Playlist💦💦",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "20 songs • 2hr 12min",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Icon(Icons.arrow_circle_down, color: Colors.white70,size: 28,),
                          SizedBox(width: 20,),
                          Icon(Icons.person_add_alt_rounded,color: Colors.white70, size: 28,),
                          Expanded(child: SizedBox(width: double.infinity,)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.green,
                              child: Icon(Icons.play_arrow_rounded, color: Colors.black,size: 35,),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            childCount: 20,
              (context, index){
              return Container(
                height: 50,
                child: Card(
                  color: Colors.black,
                  shadowColor:  Colors.deepPurple,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image(image: NetworkImage(ProductDetails.products[index].img!),height: 35,width: 35,fit: BoxFit.fitHeight,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Text("#Song No.${index+1}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600,color: Colors.white),),
                            SizedBox(height: 5,),
                            Text("by joe Biden", style: TextStyle(fontSize: 10,color: Colors.white),)
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox(width: double.infinity,)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.more_horiz_rounded, color: Colors.white,),
                      ),
                    ],
                  ),
                ),
              );
              }
          ))
        ],
      ),
    );
  }
}
