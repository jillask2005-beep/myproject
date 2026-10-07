import 'dart:convert';

import 'package:amazon/Amazon/UserDetails.dart';
import 'package:amazon/Cartpage.dart';
import 'package:amazon/amazonloginpage.dart';
import 'package:amazon/productdetail2.0.dart';
import 'package:amazon/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'cat.dart';
import 'productDetails.dart';
class amazon extends StatefulWidget {
  const amazon({super.key});

  @override
  State<amazon> createState() => _amazonState();
}

class _amazonState extends State<amazon> {
  // List bottom_screens=[
  //   amazon(),
  //   Search(),
  //   //Drawer(),
  //   CartPage(),
  //   Cat()
  // ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List productList=[];
  int _selectedIndex=0;
  Future<classroom>getData()async{
    try{
      var apiresponse=await http.get(Uri.parse("https://dummyjson.com/products"));
      print(apiresponse);
      print(apiresponse.statusCode);
      if(apiresponse.statusCode==200){
        Map<String,dynamic> data=jsonDecode(apiresponse.body);
        productList=data["products"];
        return classroom.fromJson(data);
      }else{
        throw Exception("no found data");
      }
    }catch (e){
      throw e;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: CircleAvatar(
          radius: 10,
          child: Image(image: AssetImage("amazon.png"),fit: BoxFit.fill,),
        ),
     title: Container(
       height: 40,
       width: 260,
       // child: TextFormField(
       //   decoration: InputDecoration(hintText: "search",hintStyle: TextStyle(color: Colors.blue),
       //    // prefixIcon: Icon(Icons.search),
       //   //  icon: Icon(Icons.shopping_cart),
       //     border: OutlineInputBorder(
       //     ),
       decoration: BoxDecoration(
         border: BoxBorder.all(),
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Expanded(
             child: TextFormField(
                decoration: InputDecoration(hintText: "search",hintStyle: TextStyle(color: Colors.blue),)),
           ),
           Icon(Icons.search)
         ],
       ),
         ),


        centerTitle: true,
        actions: [
          Icon(Icons.shopping_cart)
        ],
      ),
      body:FutureBuilder(future: getData(), builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator();
        }else if(snapshot.hasError){
          return Text("error${snapshot.error}");
        }else if(snapshot.hasData){
          List<Products> products=snapshot.data!.products??[];
          return ListView.builder(itemCount: products.length,itemBuilder: (context,int index){


            return Card(
              color: Colors.white70,
              child: GestureDetector
                (onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>productdetail(productId: productList[index]["id"],)));
              },
                child: Row(
                  children: [
                    Image.network( productList[index]["images"][0],height: 200,width: 150),
                    SizedBox(width: 15,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productList[index]["title"],style: TextStyle(color: Colors.blue,fontSize: 13,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: (){}, child: Text("${productList[index]["reviews"][0]["rating"]} ★",style: TextStyle(color: Colors.white,),),),
                        SizedBox(height: 3,),
                        Text("${productList[index]["warrantyInformation"]}",style: TextStyle(color: Colors.black,fontSize: 12),),
                        SizedBox(height: 3,),
                        Text("${productList[index]["price"]}",style: TextStyle(color: Colors.black,fontSize: 12),),
                        SizedBox(height: 3,),
                        Text("${productList[index]["shippingInformation"]}",style: TextStyle(color: Colors.black,fontSize: 12),),
                        SizedBox(height: 3,),
                        Text("${productList[index]["availabilityStatus"]}",style: TextStyle(color: Colors.black,fontSize: 12)),
                        Text("${productList[index]["brand"]}",style: TextStyle(color: Colors.black,fontSize: 12)),
                      ],
                    )

                  ],
                ),
              ),
            );
          },);

        }else{
          return Text("no data found");
        }
      }),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ), // BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  accountName: Text(
                    "Srikanth",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("sri@gamil.com"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 165, 255, 137),
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 30.0, color: Colors.blue),
                    ), // Text
                  ), // CircleAvatar
                ), // UserAccountDrawerHeader
              ), // DrawerHeader
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' My Profile '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text(' My Course '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title: const Text(' Go Premium '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_label),
                title: const Text(' Saved Videos '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text(' Edit Profile '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>amazonloginpage()));
                },
              ),
            ],
          ),
        ),
    //     bottomNavigationBar: BottomNavigationBar(
    //       type: BottomNavigationBarType.fixed,
    //       showUnselectedLabels: true,
    //       showSelectedLabels: true,
    //       backgroundColor: Colors.blueGrey,
    //       selectedItemColor: Colors.deepOrange,
    //       unselectedItemColor: Colors.blue,
    //       onTap: (index){
    //         setState(() {
    //           _selectedIndex = index;
    //         });
    //         // if(index==4){
    //         //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cat(),));
    //         // }
    //         // else
    //           if(index==2) {
    //             _scaffoldKey.currentState?.openDrawer();
    //           }
    //         // else if(index==1){
    //         //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
    //         // }
    //       },items: [
    //     BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "home"),
    // BottomNavigationBarItem(icon: Icon(Icons.search),label: "search"),
    //       BottomNavigationBarItem(icon: Icon(Icons.person_pin),label: "User"),
    // BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "shopping"),
    // BottomNavigationBarItem(icon: Icon(Icons.category),label: "category"),
    //
    // ],
    //
    //
    //
    //     )


    );
  }
}
class classroom {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  classroom({this.products, this.total, this.skip, this.limit});

  classroom.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Products(
      {this.id,
        this.title,
        this.description,
        this.category,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.tags,
        this.brand,
        this.sku,
        this.weight,
        this.dimensions,
        this.warrantyInformation,
        this.shippingInformation,
        this.availabilityStatus,
        this.reviews,
        this.returnPolicy,
        this.minimumOrderQuantity,
        this.meta,
        this.images,
        this.thumbnail});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    tags = json['tags'].cast<String>();
    brand = json['brand'];
    sku = json['sku'];
    weight = json['weight'];
    dimensions = json['dimensions'] != null
        ? new Dimensions.fromJson(json['dimensions'])
        : null;
    warrantyInformation = json['warrantyInformation'];
    shippingInformation = json['shippingInformation'];
    availabilityStatus = json['availabilityStatus'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    returnPolicy = json['returnPolicy'];
    minimumOrderQuantity = json['minimumOrderQuantity'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    images = json['images'].cast<String>();
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['tags'] = this.tags;
    data['brand'] = this.brand;
    data['sku'] = this.sku;
    data['weight'] = this.weight;
    if (this.dimensions != null) {
      data['dimensions'] = this.dimensions!.toJson();
    }
    data['warrantyInformation'] = this.warrantyInformation;
    data['shippingInformation'] = this.shippingInformation;
    data['availabilityStatus'] = this.availabilityStatus;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['returnPolicy'] = this.returnPolicy;
    data['minimumOrderQuantity'] = this.minimumOrderQuantity;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['images'] = this.images;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  Dimensions.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['depth'] = this.depth;
    return data;
  }
}

class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews(
      {this.rating,
        this.comment,
        this.date,
        this.reviewerName,
        this.reviewerEmail});

  Reviews.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    comment = json['comment'];
    date = json['date'];
    reviewerName = json['reviewerName'];
    reviewerEmail = json['reviewerEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['date'] = this.date;
    data['reviewerName'] = this.reviewerName;
    data['reviewerEmail'] = this.reviewerEmail;
    return data;
  }
}

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  Meta.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    barcode = json['barcode'];
    qrCode = json['qrCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['barcode'] = this.barcode;
    data['qrCode'] = this.qrCode;
    return data;
  }
}

