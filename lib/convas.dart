import 'package:amazon/listandgridview.dart';
import 'package:amazon/think.dart';
import 'package:flutter/material.dart';
class convas extends StatefulWidget {
  const convas({super.key});

  @override
  State<convas> createState() => _convasState();
}

class _convasState extends State<convas> {
  int currentIndex=0;
  List<Products>productsList=[
Products(image: "banna.png", price: 50, name: "banna"),
    Products(image: "orange.png", price: 250, name: "orange"),
    Products(image: "mango.png", price: 180, name: "mango"),
    Products(image: "carrot.png", price: 60, name: "carrot"),
    Products(image: "apple.png", price: 260, name: "apple"),
    Products(image: "sr.png", price: 650, name: "fruits"),
    Products(image: "sss.png", price: 350, name: "fruits5"),
    Products(image: "str.png", price: 160, name: "strawberry"),
    Products(image: "grapes.png", price: 120, name: "grapes"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fruits store"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "search",
                prefixIcon:const Icon(Icons.search) ,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("apple.png"),fit: BoxFit.fill),),
            ),
          ),
          SizedBox(height: 10 ),
          Expanded(child:
          GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2
          ,crossAxisSpacing: 5,mainAxisSpacing: 5,childAspectRatio: 0.7
          ),
              itemCount:productsList.length,
    itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>think(indexValue:index)));
              },
              child: Card(
                child: Column(
                  children: [
                    Expanded(child:
                    Image.asset("assets/${productsList[index].image}",fit: BoxFit.cover,),),
                    Text("₹${productsList[index].price}",style: TextStyle(color: Colors.black),)
                  ],
                ) ,
              ),
            );
          }))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex=index;

        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "search"),
        BottomNavigationBarItem(icon: Icon(Icons.person_pin),label: "profile")
      ],
      ),

    );
  }
}
