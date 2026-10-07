// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// class slider extends StatefulWidget {
//   const slider({super.key});
//
//   @override
//   State<slider> createState() => _sliderState();
// }
//
// class _sliderState extends State<slider> {
//   List slider=[];
//   Future<List>getSlider()async{
//     try{
//       var apiresponses=await http.get(Uri.parse("https://dummyjson.com/products/30"));
//       print(apiresponses);
//       print(apiresponses.statusCode);
//       if(apiresponses.statusCode==200){
//         slider=jsonDecode(apiresponses.body);
//         print(slider);
//         return slider;
//       }else{
//         throw Exception("no found data");
//       }
//     }catch(e){
//       print(e);
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//
//       ),
//       body: FutureBuilder(future: getSlider(), builder: (context,snapshot){
//         if(snapshot.connectionState==ConnectionState.waiting){
//           return CircularProgressIndicator();
//         }else if(snapshot.hasError){
//           return Text("error${snapshot.error}");
//         }else if(snapshot.hasData){
//           return
//         }
//       }),
//     );
//   }
// }
