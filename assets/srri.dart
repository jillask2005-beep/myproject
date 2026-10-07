// import 'package:flutter/material.dart';
// class carrot extends StatefulWidget {
//   carrot({super.key});
//   final List<Map<String,dynamic>>cartItems=[
//     {
//       "imafe":"apple.png",
//       "name":"apple",
//       "wight":"1kg",
//       "price":120,
//     },
//     {
//       "image":"banna.png",
//       "name":"banna",
//       "wight":"1kg",
//       "peice":60,
//     },
//     {
//       "image":"carrot.png",
//       "name":"carrot",
//       "wight":"1kg",
//       "price":30,
//     },
//     {
//       "image":"orange.png",
//       "name":"orange",
//       "wight":"1kg",
//       "price":120,
//     },
//     {
//       "image":"mango.png",
//       "name":"mango",
//       "wight":"1kg",
//       "price":150
//     }
//
//   ];
//
//   @override
//   State<carrot> createState() => _carrotState();
// }
//
// class _carrotState extends State<carrot> {
//   @override
//   Widget build(BuildContext context) {
//     int total=cartItems.fold(0,(sum,item)=>sum+item["price"]as int);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("your cart"),
//         centerTitle: true,
//       ),
//       body: Padding(padding: const EdgeInsets.all(15),
//       child: Column(
//         children: [
//           Expanded(child:
//           ListView.builder(
//             itemCount: 10,
//             itemBuilder: (context,index){
//               return Card(
//                 margin: const EdgeInsets.only(bottom: 12),
//                 child: ListTile(
//                   leading: Image.asset(cartItems[index]["image"],
//                   width: 50,
//                   height: 50,),
//                 ),
//               );
//             },
//           ))
//         ],
//       ),),
//     )
//   }
// }
