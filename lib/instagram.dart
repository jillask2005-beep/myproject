import 'package:flutter/material.dart';
class insta extends StatefulWidget {
  const insta({super.key});

  @override
  State<insta> createState() => _instaState();
}

class _instaState extends State<insta> {
  List<String> images=[
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png',
    'assets/store.png',
    'assets/post1.png',
    'assets/post2.png',
    'assets/post3.png',
    'assets/sss.png'

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add_sharp,
          color: Colors.white,
        ),
        title: Text("Instagram",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.favorite,
              color: Colors.red[700],
            ),
          ),
        ],backgroundColor: Colors.pink[200],

      ), body: ListView(
      children: [
        SizedBox(
          height: 90,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(5),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.pinkAccent,
                width: 3,
              ),
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,

              ),

            ),
          );
        },
          ),
          ),SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.pink[200],
          ),
          title: Text("_Flutter_"),
          trailing: Icon(Icons.more_vert),
        ),
        Image.asset(images[5],
          height: 300,
          width: 300,
          fit: BoxFit.cover,
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),),
        Row(
          children: [
            Icon(Icons.favorite_border,size: 20),SizedBox(width: 5,),
            Text("68.6k"),
            SizedBox(width: 10),
            Icon(Icons.mode_comment_outlined,size: 20),SizedBox(width: 5,),
            Text("144"),
            SizedBox(width: 10,),
            Icon(Icons.repeat,size: 20),SizedBox(width: 5,),
            Text("1,085"),
            SizedBox(width: 10),
            Icon(Icons.send_outlined,size: 20),SizedBox(width: 5),
            Text("26.2k"),
            Spacer(),
            Icon(Icons.bookmark_border,size: 20,),
          ],
        ),
        SizedBox(height:30,),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.lightBlueAccent,
          ),
          title: Text("Lib_rary"),
          trailing: Icon(Icons.more_vert),
        ),
        Image.asset(images[4],
          height: 300,
          width: 300,
          fit: BoxFit.cover,
        ),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),),
      Row(
        children: [
          Icon(Icons.favorite_border,size: 20,),SizedBox(width: 5,),
          SizedBox(width: 5),
          Text("100k"),
          SizedBox(width: 10,),
          Icon(Icons.mode_comment_outlined,size: 20,),SizedBox(width: 5,),Text("155"),
          SizedBox(width: 10,),
          Icon(Icons.repeat,size: 20,),SizedBox(width: 5,),
          Text("1546"),
          SizedBox(width: 10,),
          Icon(Icons.send_outlined,size: 20,),SizedBox(width: 5,),
          SizedBox(width: 10,),
          Spacer(),
          Icon(Icons.bookmark_border,size: 20,)
          
          
        ],
      ),
      SizedBox(height: 30,),
      ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red[300],
        ),
        title: Text("Book_Store"),
        trailing: Icon(Icons.more_vert),
      ),
      Image.asset(images[1],
        height: 300,
        width: 300,
        fit: BoxFit.cover,
      ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),),
        Row(
          children: [
        Icon(Icons.favorite_border,size: 20,),SizedBox(width: 5,),
        Text("1m"),
        SizedBox(width: 10,),
        Icon(Icons.mode_comment_outlined,size: 20,),SizedBox(width: 5,),
        Text("562"),
        SizedBox(width: 10,),
        Icon(Icons.repeat,size: 20,),SizedBox(width: 5,),
        Text("2500"),
        SizedBox(width: 10,),
        Icon(Icons.send_outlined,size: 20,),SizedBox(width: 5,),
        Text("8506"),
        Spacer(),
        Icon(Icons.bookmark_border,size: 20,)
       ] ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.yellow,
          ),
          title: Text("post"),
          trailing: Icon(Icons.more_vert),
        ),
        Container(
          height: 300,width: 300,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/post2.png"),fit: BoxFit.cover)),
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),),
        Row(
          children: [
            Icon(Icons.favorite_border,size: 20,),SizedBox(width: 5,),
            Text("170k"),
            SizedBox(width: 10,),
            Icon(Icons.mode_comment_outlined,size: 20,),SizedBox(width: 5,),
            Text("200"),
            SizedBox(width: 10,),
            Icon(Icons.repeat,size: 20,),SizedBox(width: 5,),
            Text("35"),
            SizedBox(width: 10,),
            Icon(Icons.send_outlined,size: 20,),SizedBox(width: 5,),
            Text("60"),
            Spacer(),
            Icon(Icons.bookmark_border,size: 20,),


          ],
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green,
          ),
          title: Text("poster"),
          trailing: Icon(Icons.more_vert),
        ),
        Container(
          height: 300,width: 300,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("sss.png"),fit: BoxFit.cover)),
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),),
        Row(
          children: [
            Icon(Icons.favorite_border,size: 20,),SizedBox(width: 5,),
            Text("121.9k"),
            SizedBox(width: 10,),
            Icon(Icons.mode_comment_outlined,size: 20,),SizedBox(width: 5,),
            Text("88"),SizedBox(width: 10,),
            Icon(Icons.repeat,size: 20,),SizedBox(width: 5,),
            Text("88"),SizedBox(width: 10,),
            Icon(Icons.send_outlined,size: 20,),SizedBox(width: 5,),Text("76"),
            SizedBox(width: 10,),
            Spacer(),
            Icon(Icons.bookmark_border,size: 20,),

          ],
        ),
        SizedBox(height: 25,)


      ],
          ),
           bottomNavigationBar: BottomNavigationBar(
             type: BottomNavigationBarType.fixed,
             showUnselectedLabels: true,
             showSelectedLabels: true,
            backgroundColor: Colors.pink[200],
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.video_library),label: "Reels"),
          BottomNavigationBarItem(icon: Icon(Icons.send),label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin),label: "Profile"),
  ]),

    );

  }
}