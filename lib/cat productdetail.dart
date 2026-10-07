import 'dart:convert';


import 'package:amazon/AMAZON2.0.dart';
import 'package:amazon/productdetail2.0.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class catproduct extends StatefulWidget {
  final String category;
  const catproduct({super.key,required this.category});

  @override
  State<catproduct> createState() => _catproductState();
}

class _catproductState extends State<catproduct> {
  PageController pageController=PageController();
  @override
  void initState(){
    setState(() {
      super.initState();
      getcategory();
    });
  }
List categoryproductdetails=[];
Future<List> getcategory() async{
  try{
    var apiresponses=await http.get(Uri.parse("https://dummyjson.com/products/category/${widget.category}"));
    print(apiresponses.statusCode);
    if(apiresponses.statusCode==200){
      var response=jsonDecode(apiresponses.body);
      categoryproductdetails=response["products"];
      print(categoryproductdetails);
     return categoryproductdetails;

    }else{
      throw Exception("no data found");
    }
  }catch (e){
    throw e;
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("category page"),centerTitle: true,
      ),

      body: FutureBuilder(future: getcategory(), builder:(context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator();
        }else if(snapshot.hasError){
          return Text("error${snapshot.error}");
        }else if(snapshot.hasData){
          return ListView.builder(itemCount: categoryproductdetails.length,itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child:Container(
                width: 280,
                height: 400,
                decoration: const BoxDecoration(
                  color: Color(0xFFE2BFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [

                    // IMAGE SECTION
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => productdetail(
                                productId: categoryproductdetails[index]["id"],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: Image.network(
                            categoryproductdetails[index]["images"][0],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    // BOTTOM SECTION
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 8,
                      ),
                      color: const Color(0xFF1A73E8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            categoryproductdetails[index]["title"],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            "₹${categoryproductdetails[index]["price"]}",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            );

          });



        }else{
          return Text("no data found");
        }
      }),
    );
  }
}

