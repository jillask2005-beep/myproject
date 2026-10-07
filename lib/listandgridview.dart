import 'package:amazon/productDetails.dart';
import 'package:flutter/material.dart';
import 'productDetails.dart';
class ListandGrid extends StatefulWidget {
  const ListandGrid({super.key});

  @override
  State<ListandGrid> createState() => _ListandGridState();
}

class _ListandGridState extends State<ListandGrid> {

  List<Products> productList =[
    Products(image: "img_1.png", price: 12000, name: "MOTOROLA Motobook 60 Pro Full Metal AI PC 2.8K OLED Intel Core Ultra 5 225H - (16 GB/512 GB SSD/Window..."),
    Products(image: "realme.png", price: 18000, name: "FRONY EQ-1033 P47 Headset Super Extra Bass Bluetooth Headset (Furious On the Ear) Bluetooth Headset (Multicolor, True Wireless)"),
    Products(image: "sumsung.png", price: 32000, name: "Samsung Galaxy F70e 5G (Limelight Green, 128 GB)"),
    Products(image: "google.png", price: 48000, name: "Google GP 3XL (White, 128 GB)"),
    Products(image: "iphone.png", price: 69999, name: "Apple iPhone 15 (Black, 128 GB)"),
    Products(image: "iphone17.png", price: 120000, name: "Apple iPhone 17 (Black, 256 GB)"),
    Products(image: "real.png", price: 26000, name: "realme P4 Power 5G (TransSilver, 128 GB)"),
    Products(image: "poco.png", price:23000, name: "POCO C85x (Elite Black, 64 GB)"),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List and Grid view builders"),
      ),
      body: Column(
        children: [
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "search",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
      ),
    ),
  ),
),
          SizedBox(height: 10,),
          Container(
            height: 90,
            //   width: 400,

            color: Colors.orangeAccent,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Category.cat.length,
                itemBuilder: (context,index){
                  return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(backgroundImage: NetworkImage(Category.cat[index]),),




                        Text(Category.names[index],style: TextStyle(color: Colors.black,fontSize: 12),)
                      ],
                    ),
                  );
                }
            ),
          ),


          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                childAspectRatio: 0.7,
                mainAxisSpacing: 0.5,
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductDetailsPage(indexValue:index)));

                  },
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            productList[index].image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(child: Text(productList[index].name!)),
                        const SizedBox(height: 5,),
                        Text("₹${productList[index].price}"),
              
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}

class Products {
  String? image;
  double? price;
  String? name;

  Products({required this.image, required this.price, required this.name});

  Products.toJson(){

  }
}



class Category{
  static List<String> cat=[
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoPmfAXzH86XaJN4BCMbvURO3Svmy6GiF3gI3ieHS-ig&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJD7-x9ytjLO1gaWE6jwh7QBjN159UjHUiPevjGZn6wQ&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFOeSd8MmhVAZLQ2iypx12moiIahrhSSbRHG1lvIO7Sw&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7V_JIlo-uZYOzcWszli6J-pytjo4QO_VzKNatdxPLrA&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh0FzaYAULDinh7EgKYmE9i7Zmsz4ZO6XLiIWxXmUPaw&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoPmfAXzH86XaJN4BCMbvURO3Svmy6GiF3gI3ieHS-ig&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJD7-x9ytjLO1gaWE6jwh7QBjN159UjHUiPevjGZn6wQ&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFOeSd8MmhVAZLQ2iypx12moiIahrhSSbRHG1lvIO7Sw&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7V_JIlo-uZYOzcWszli6J-pytjo4QO_VzKNatdxPLrA&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh0FzaYAULDinh7EgKYmE9i7Zmsz4ZO6XLiIWxXmUPaw&s=10"
  ];
  static List names=[
    "Electronics",
    "Laptops",
    "Cosmetics",
    "Shoes",
    "Toys",
    "Electronics",
    "Laptops",
    "Cosmetics",
    "Shoes",
    "Toys"
  ];
}