import 'dart:convert';

import 'package:amazon/productdetail2.0.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Search extends StatefulWidget {
  const Search({super.key});
  @override
  State<Search> createState() => _SearchState();
}
class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  List product = [];
  Future<void> seachProduct(String value) async {
    if (value.isEmpty) {
      setState(() {
        product = [];
      });
      return;
    }
    try {
      var responses = await http.get(
        Uri.parse(
          "https://dummyjson.com/products/search?q=$value",
        ),
      );
      print("Status: ${responses.statusCode}");
      if (responses.statusCode == 200) {
        var data = jsonDecode(responses.body);
        setState(() {
          product = data["products"];
        });
        print("Products: ${product.length}");
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: searchController,
            onChanged: (value) {
              seachProduct(value);
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Search here",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
      body: product.isEmpty
          ? const Center(
        child: Text("Search product"),
      )
          : ListView.builder(
        itemCount: product.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>productdetail(productId: product[index]["id"])));
            },

            leading: Image.network(
              product[index]["thumbnail"],
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(
              product[index]["title"],
            ),
            subtitle: Text(
              "${product[index]["price"]}",
            ),
          );
        },
      ),
    );
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
