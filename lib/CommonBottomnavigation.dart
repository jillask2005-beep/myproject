import 'package:amazon/search.dart';
import 'package:flutter/material.dart';

import 'AMAZON2.0.dart';
import 'Cartpage.dart';
import 'amazonloginpage.dart';
import 'cat.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List bottom_screens=[
    amazon(),
    Search(),
    CartPage(),
    Cat()

  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
      body: bottom_screens[_selectedIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          backgroundColor: Colors.blueGrey,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.blue,
          onTap: (index){
            if(index == 4) {
              _scaffoldKey.currentState?.openDrawer();
              return;
            }
            setState(() {
              _selectedIndex = index;
            });
            // if(index==4){
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cat(),));
            // }
            // else

            // else if(index==1){
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
            // }
          },items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "search"),

          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "shopping"),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "category"),
           BottomNavigationBarItem(icon: Icon(Icons.person_pin),label: "User"),

        ],



        )
    );
  }
}
