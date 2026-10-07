import 'package:amazon/Amazon/flipcart.dart';
import 'package:flutter/material.dart';

class Insta extends StatefulWidget {
  const Insta({super.key});

  @override
  State<Insta> createState() => _InstaState();
}

class _InstaState extends State<Insta> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,

          title: Row(
            children: [
              Text(
                "Kritin",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_arrow_down_sharp)
            ],
          ),

          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_box_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
          ],
        ),

        body: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [

                  CircleAvatar(
                    radius: 42,
                    backgroundImage:
                    AssetImage("assets/banna.png"),
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [

                        Column(
                          children: [
                            Text("24",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            Text("Posts"),
                          ],
                        ),

                        Column(
                          children: [
                            Text("2.1K",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            Text("Followers"),
                          ],
                        ),

                        Column(
                          children: [
                            Text("189",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            Text("Following"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kritin",
                      style: TextStyle(
                        fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                        "Likes to game: Roblox,Minecraft,P25\nFavourite Anime: JJK\nNo hobbies"),
                  ],
                ),
              ),
            ),

            SizedBox(height: 14),

            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [

                  Expanded(
                    child: Container(
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey),
                        borderRadius:
                        BorderRadius.circular(8),
                      ),
                      child: Text("Edit profile"),
                    ),
                  ),

                  SizedBox(width: 8),

                  Expanded(
                    child: Container(
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey),
                        borderRadius:
                        BorderRadius.circular(8),
                      ),
                      child: Text("Share profile"),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                padding:
                EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                     EdgeInsets.only(right: 14),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                          Colors.grey,
                        ),
                        SizedBox(height: 6),
                        Text("Story",
                            style:
                            TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                },
              ),
            ),

            TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: [
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.video_collection_outlined)),
                Tab(icon: Icon(Icons.person_pin_outlined)),
                Tab(icon: Icon(Icons.bookmark_border)),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [

                  GridView.builder(
                    itemCount: 20,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Image.network(
                        ProductDetails.products[index].img!,
                        fit: BoxFit.cover,
                      );
                    },
                  ),

                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetails {
  static get products => null;
}