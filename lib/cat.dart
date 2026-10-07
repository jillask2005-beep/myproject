import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'cat productdetail.dart';
class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  List categories=[];
  Future<List> getCategories() async{
    try{
      var apiresponses=await http.get(Uri.parse("https://dummyjson.com/products/category-list"));
      print(apiresponses);
      print(apiresponses.statusCode);
      if(apiresponses.statusCode==200){
        categories=jsonDecode(apiresponses.body);
        return categories;
      }else{
        throw Exception("no data found");
      }
    }catch(e){
      throw e;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("category"),centerTitle: true,
      ) ,
      body:FutureBuilder(future: getCategories(), builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator();
        }else if(snapshot.hasError){
          return Text("Error${snapshot.error}");
        }else if(snapshot.hasData){
          return GridView.builder(

            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Card(

                child:GestureDetector(
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>catproduct(category:categories[index])));
                  },

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                         height:70 ,width: 60,
                        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(CategoryImages.cats[index]),fit: BoxFit.cover)),
                       // decoration: BoxDecoration(image: DecorationImage(image: AssetImage("beauty.png"),fit: BoxFit.cover)),
                      ),
                    ),
                    Text(categories[index]),

                  ],
                )
                ),
              );

            },
          );
        }else{
          return Text("no data found");
        }
      }),
    );
  }
}

/////////////////////////////////////
class CategoryImages{
  static List cats=[
    "https://t3.ftcdn.net/jpg/05/68/96/58/240_F_568965817_Q8pj5KdFzggFD44LISbXxB7s8iE0x08y.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPy-rxnzxmDLYE3nzSJfw6-Yq_KTU-Do5UZfjSTp-BIw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkTetnZ_OgVP6fIoxp3aVnOiXVfaYDtvPCv2Rdvl4UyQ&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKNi7Y3Psr_OJCE1ayaZiNr2VNTVcwi8Uz6w20FfwG1g&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiZNH9-XcSh-PWXTjLz-hwCb72Eped7EDmAh4kKcc3cg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlVyvHpJoCgFwjlVpKs0q3gB8I910CNGWb3OtJGWravw&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvgFEc1kWu2eY-8IGqZ83CA7MwiauVr0YZnLovtV-dxg&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBG9Ti3S7VHYV4u9_xzZhxEaVsZTFuQRtd5kjmUaTPJw&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxavHXYL0HfirMxp2duh02f6aKOLjEZE5jp5idWYgJBg&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwPcbQ9hbq8Vlw02-rbLWzmD9KFZsglNt6e0mZx_1-DQ&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT4WJmCLLJsk3BZoE8kL5WYKoSgSuy_ij-0cqHASNtEA&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdFkD0jAbGB4ENbH1he35khXCbU6ANW5IbOVUjfbUINg&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9iC3BQa8EbKZgQNzdoEwJEU5GUkrZp0dDLi0-N9hZQA&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr_4C610ElHa6snLa0gzRcZNNi3NgMib8rsXumWjBopg&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScYmjQ0LNsqHDvCub41_IqyCbIZgIj4jwnv4KtZGj5AQ&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIvOGmQBvUKHMKGQQaR12WV53d-OV_6aAOPVmPoFlRXg&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDpXpGznDQJs4LwMirAaHKiant5R2_L5bDS4q3-3AHaQ&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmnag4oWfd3ODN28kGq2reO4mN0FlFRqnLnKsMUJ2nKA&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEQbx8sv6Lddglb1dixbh31_IEKOOPZREioJJCq3jFCQ&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMf0cnYFLMaKr3xBvMgUIn3g0ZRG-iHzJQI6xRdU-zdw&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaq2tB4QTbczqPX7j5lWt-9Rh29d_9_BgcBzbMr6yITA&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKd1wAIReXu6InnreA7VHStJfqdcVbqioNP5i_p5LHRA&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_clGgfAC2e45XHrfO-4jFvw-zUKHzG1ixnI4RFnKU-Q&s=10",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9B-WcL7WLPC7vth7Iyy0t2BYe_QDsHGuJyTpKTb2BlQ&s=10"

  ];
}
