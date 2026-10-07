import 'package:amazon/listandgridview.dart';
import 'package:amazon/think.dart';
import 'package:flutter/material.dart';
class shop extends StatefulWidget {
  const shop({super.key});

  @override
  State<shop> createState() => _shopState();
}

class _shopState extends State<shop> {
  List<Products>productList=[
    Products(image: "apple.png", price: 200, name: "apple"),
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
        title: Text("find products"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
              mainAxisSpacing: 0.5,
            ), itemCount: 10,
                itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>think(indexValue:index)));
                },
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(productList[index].image!,fit: BoxFit.fill,),
                      ),
                      Container(
                          child: Text(productList[index].name!)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("₹${productList[index].price}"),
                    ],
                  ),
                ),
              );

                }

            ),
          )
        ],
      ),
    );
  }
}
