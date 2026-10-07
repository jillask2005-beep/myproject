import 'package:flutter/material.dart';
class sricode extends StatefulWidget {
   sricode({super.key});
final List<Map<String,dynamic>>cartItems=[
  {
    "image":"apple.png",
    "name":"apple",
    "weight":"1kg",
    "price":120
,},
  {
   "image":"banna.png",
   "name":"banana",
   "weight":"1kg",
   "price":70,
  },
  {
    "image":"orange.png",
    "name":"orange",
    "weight":"1kg",
    "price":150,
  },
  {
    "image":"carrot.png",
    "name":"carrot",
    "weight":"1kg",
    "price":60,
  },
  {
    "image":"mango.png",
    "name":"mango",
    "weight":"1kg",
    "price":230,
  }
];
  @override
  State<sricode> createState() => _sricodeState();
}

class _sricodeState extends State<sricode> {
  @override
  Widget build(BuildContext context) {
    int total=widget.cartItems.fold(0,(sum,item)=>sum+item["price"] as int,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Add to card"),
    centerTitle: true,
      ),
    body: Padding(padding: const EdgeInsets.all(15),
    child: Column(
    children: [
      Expanded(child:
    ListView.builder(
    itemCount: 5,
    itemBuilder: (context,index){
      return Card(
      margin: const EdgeInsets.only(bottom: 10),
    elevation: 2,
        child: ListTile(
            leading: Image.asset(widget.cartItems[index]["image"],
              width: 50,height: 50,),
          title:Text(widget.cartItems[index]["name"],),
          subtitle:Text(widget.cartItems[index]["weight"]),
          trailing:Text("Rs${widget.cartItems[index]["price"]}"),
        ),

      );

    },
    ),),
      const Divider(
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("payable amount",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Text("Rs $total/-",style: const TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),),
        ],
      ),
      const SizedBox(height: 10,),
      SizedBox(width: double.infinity,
        height: 50,child: ElevatedButton(
      style: ElevatedButton.styleFrom
        (backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),),),
      onPressed: (){},
          child: const Text("go to checkout",style: TextStyle(
        fontSize: 18,color: Colors.white,
      ),),),),
    ],
    ),),
    );
  }
}
