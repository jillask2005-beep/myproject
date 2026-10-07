  import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
  class ProductDetailsPage extends StatefulWidget {
    int indexValue;
    ProductDetailsPage({super.key,required this.indexValue});

    @override
    State<ProductDetailsPage> createState() => _ProductDetailsPageState();
  }

  class _ProductDetailsPageState extends State<ProductDetailsPage> {

    double _rating=1;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Product Description Page"),
          ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
                Image(image: AssetImage("moto.png"),height: 150,width:250,fit: BoxFit.fill,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(child: Text("Poco C85x 5g Smartphone, Sunset Gold, 6.9 Inch Display, 32mp Dual Ai Camera, 6300mah Battery, 64gb Storage Poco C85x 5g Smartphone, Sunset Gold, 6.9 Inch Display, 32mp Dual Ai Camera, 6300mah Battery, 64gb Storage - Sunset Gold / 6.9 Inches")),
              ),
              RatingBar.builder(
                initialRating: _rating,
                itemBuilder: (BuildContext context, int index) {
                  return Icon(Icons.star,color: Colors.amber,);

                },
                onRatingUpdate: (double value) {
                  setState(() {
                    _rating=value;

                  });
                },
              ),
             SizedBox(height: 5,),
              TextButton(onPressed: (){}, child: Text("motorala store ",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_downward),
                  Text("50% OFF",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,width: 10,
                  ),
                  Text("46000",style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.black,fontSize: 18),),

                ],
              ),
              SizedBox(height: 5,),
              Text("₹23000",style: TextStyle(color: Colors.black,fontSize: 30,fontStyle: FontStyle.italic),),
              SizedBox(height: 5,),
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: (){}, child: Text("Add to card",style: TextStyle(color: Colors.black),),),),

                  SizedBox(width: 20,),
                  Expanded(child:  ElevatedButton(onPressed: (){}, child: Text("buy Now",style: TextStyle(color: Colors.black),)))

                ],
              )
            ],
          ),
        ),
      ),


      );
    }
  }