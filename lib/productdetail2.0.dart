import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
class productdetail extends StatefulWidget {
  final int productId;
    productdetail({super.key,required this.productId});

  @override
  State<productdetail> createState() => _productdetailState();
}

class _productdetailState extends State<productdetail> {

  int _currentIndex = 0;
     PageController pageController=PageController();
  @override
  void initState() {
    setState(() {
      super.initState();
     // getSingleProduct();
    });

  }
  Map<String,dynamic>product={};
  Future<Map> getSingleProduct() async{
 try{
   var response=await http.get(Uri.parse("https://dummyjson.com/products/${widget.productId}"));


   print(response.statusCode);
   if(response.statusCode==200){
     product=jsonDecode(response.body);
     print(product);
     return product;

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
        title: Text("product details"),centerTitle: true,
      ),
    body: FutureBuilder(future: getSingleProduct(), builder: (context,snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text("Error: ${snapshot.error}");
      } else if (snapshot.hasData) {
        var product=snapshot.data!;
        List images=product["images"]??[];
        return SingleChildScrollView(
           child: Column(
             children: [
               CarouselSlider.builder(
                 itemCount: images.length,

                 itemBuilder: (context, index, realIndex) {
                   return Container(
                     width: double.infinity,
                     margin: EdgeInsets.symmetric(horizontal: 5),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Colors.grey.shade200,
                     ),

                     child: Image.network(
                       images[index],
                       fit: BoxFit.contain,

                       errorBuilder: (context, error, stackTrace) {
                         return Icon(
                           Icons.image_not_supported,
                           size: 100,
                         );
                       },
                     ),
                   );
                 },

                 options: CarouselOptions(
                   height: 300,
                   viewportFraction: 1.0,
                   autoPlay: images.length > 1,
                   enableInfiniteScroll: images.length > 1,

                   onPageChanged: (index, reason) {
                     setState(() {
                       _currentIndex = index;
                     });
                   },
                 ),
               ),

               // Dots Indicator
               if (images.length > 1)
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: List.generate(
                     images.length,
                         (index) {
                       return Container(
                         width: _currentIndex == index ? 12 : 8,
                         height: _currentIndex == index ? 12 : 8,

                         margin: EdgeInsets.symmetric(
                           horizontal: 4,
                         ),

                         decoration: BoxDecoration(
                           shape: BoxShape.circle,

                           color: _currentIndex == index
                               ? Colors.blue
                               : Colors.grey,
                         ),
                       );
                     },
                   ),
                 ),


               // Padding(
               //   padding: const EdgeInsets.all(8.0),
               //
               //   child: Container(
               //     height: 300,
               //     width: double.infinity,
               //     decoration: BoxDecoration(color: Colors.grey),
               //     child: PageView.builder(controller:pageController,itemCount:images.length,itemBuilder:(context,index){
               //
               //         return GestureDetector(
               //           onTap: (){
               //             if(index<images.length-1){
               //               pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
               //             }
               //           },
               //           child: Image.network(
               //             images[index],fit: BoxFit.contain,
               //             errorBuilder: (context,error,stackTrack){
               //               return Icon(Icons.image_not_supported,size: 100,);
               //             },
               //           ),
               //         );
               //     }
               //     )
               //   ),
               // ),
             const SizedBox(
            height: 20,
        ),
               Padding(padding: EdgeInsets.all(16),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("${product["title"]}"),
                   Text("${product["price"]}"),
                   Text("${product["rating"]}"),
                   Text("${product["stock"]}"),
                   Text("${product["description"]}"),
                   SizedBox(
                     height: 20,
                   ),
                   SizedBox(
                     height: 20,
                     width: double.infinity,
                     child: ElevatedButton
                       (onPressed: (){
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                         "product added to card"
                       ),duration: Duration(seconds: 2),));

                     }, child: Text("Add to Cart")),


                   ),
                   SizedBox(height: 10,),
                   SizedBox(height: 20,
                   width: double.infinity,child:
                   ElevatedButton(onPressed: (){
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
                     Text("order placed successfully"),duration: Duration(seconds: 2),));
                   }, child: Text("Buy Now")))

                 ],
               ),
               )
             ],
           ),
           );

      } else {
        return Text("no data found");
      }

    }
      )
    );
  }
}
