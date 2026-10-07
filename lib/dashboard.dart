import 'package:flutter/material.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_circle_outlined,
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.notifications,
              color: Colors.white,
            ),
          ),
          ],
        backgroundColor: Colors.deepPurple,

        
      ), body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Hi, Programmer",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Search here....",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),SizedBox(height: 10,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(15),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("2.png")),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey)
                    ),
                  ),
                ),SizedBox(width: 10,),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                      margin: EdgeInsets.all(15),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("3.png")),
                        shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey)

                      )
                                   ),
                   ),SizedBox(width: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                      margin: EdgeInsets.all(15),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("4.png")),
                        shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey)

                      )
                                    ),
                    ),
              ],
            ),//SizedBox(height: 10,),
            Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            margin: EdgeInsets.all(15),
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("6.png")),
                              shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)

                            ),
                        ),
                      ), SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.all(15),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("image5.png")),
                            shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey)
                          ),
                        ),
                      ), SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.all(15),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("7.png")),
                            shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey)
                          ),
                        ),
                      ),
                    ],
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Courses",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                    ),),
                  ),
                      SizedBox(width: 10,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.all(15),
                              width: 120,
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("image7.png")),
                                //border: Border.all(color: Colors.black,width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),Container(
                            margin: EdgeInsets.all(15),
                            width: 120,
                            height: 150,
                             decoration: BoxDecoration(
                           image: DecorationImage(image: AssetImage("image8.png")),
                          //border: Border.all(color: Colors.black,width: 1),
                         borderRadius: BorderRadius.circular(10),
                             ),
                      ),
                    ],
                  ),Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(15),
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("image9.png")),
                     // border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  width: 120,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("image11.png")),
                    //border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            ]
            )
        ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.grey[100],
          unselectedItemColor: Colors.blueGrey,
          selectedItemColor: Colors.deepPurpleAccent,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.description),label: "Course"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Wishlist"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account"),
          ]),

    );
  }
}
