import 'package:amazon/listandgridview.dart';
import 'package:flutter/material.dart';
class instasri extends StatefulWidget {
  const instasri({super.key});

  @override
  State<instasri> createState() => _instasriState();
}

class _instasriState extends State<instasri> {
  int currentIndex=0;
  List<Widget>pages=[
    Center(child: Text("home page"),),
    Center(child: Text("search page"),),
    Center(child: Text("reels page"),),
    Center(child: Text("message page"),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("insta ui"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(backgroundImage: NetworkImage(Category.cat[index]),)
                    ],
                  )
                );
              },
            ),
          ),
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index){
            setState(() {
              currentIndex=index;
            });
        },

          items: const[
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "search"),
            BottomNavigationBarItem(icon: Icon(Icons.smart_display),label: "reels"),
            BottomNavigationBarItem(icon: Icon(Icons.message),label: "message"),


          ],
        ),    );
  }
}


class Category{
  static List<String> cat=[
    "https://www.google.com/search?q=instagram+story+profile+image+picure+any+photos&sca_esv=5c160724a155473c&udm=2&biw=1034&bih=605&sxsrf=APpeQntWm1rQjKrU-9y3vfksT5zyJQuJGA%3A1783761839818&ei=rwtSavq-MYv1juMP3rmZiAk&ved=0ahUKEwi60s3WpsqVAxWLumMGHd5cBpEQ4dUDCBE&uact=5&oq=instagram+story+profile+image+picure+any+photos&gs_lp=Egtnd3Mtd2l6LWltZyIvaW5zdGFncmFtIHN0b3J5IHByb2ZpbGUgaW1hZ2UgcGljdXJlIGFueSBwaG90b3NI4yFQ5wZY9h9wAXgAkAEAmAGIAaABvwmqAQQwLjExuAEDyAEA-AEBmAIAoAIAmAMA4gMFEgExIECIBgGSBwCgB4QBsgcAuAcAwgcAyAcAgAgB&sclient=gws-wiz-img#sv=CAMSURoyKhBlLUZ1RUtJN1hIYU5UQTBNMg5GdUVLSTdYSGFOVEEwTToOXzBCMllBX21RZWpHTE0gBCoXCgFzEhBlLUZ1RUtJN1hIYU5UQTBNGAEwARgHIOfs4b0ISggQARgBIAEoAQ",
  "https://www.google.com/search?q=instagram+story+profile+image+picure+any+photos&sca_esv=5c160724a155473c&udm=2&biw=1034&bih=605&sxsrf=APpeQntWm1rQjKrU-9y3vfksT5zyJQuJGA%3A1783761839818&ei=rwtSavq-MYv1juMP3rmZiAk&ved=0ahUKEwi60s3WpsqVAxWLumMGHd5cBpEQ4dUDCBE&uact=5&oq=instagram+story+profile+image+picure+any+photos&gs_lp=Egtnd3Mtd2l6LWltZyIvaW5zdGFncmFtIHN0b3J5IHByb2ZpbGUgaW1hZ2UgcGljdXJlIGFueSBwaG90b3NI4yFQ5wZY9h9wAXgAkAEAmAGIAaABvwmqAQQwLjExuAEDyAEA-AEBmAIAoAIAmAMA4gMFEgExIECIBgGSBwCgB4QBsgcAuAcAwgcAyAcAgAgB&sclient=gws-wiz-img#sv=CAMSXhoyKhBlLUgxNVktbFcxVVdsQ2VNMg5IMTVZLWxXMVVXbENlTToOUVJkWFZTQVF1QWFQVk0gBCokCg5GdUVLSTdYSGFOVEEwTRIQZS1IMTVZLWxXMVVXbENlTRgAMAEYByD0navtCkoIEAEYASABKAE",
    "https://www.google.com/search?tbnid=FuEKI7XHaNTA0M&tbnh=0&tbnw=0&sca_esv=5c160724a155473c&cs=0&sxsrf=APpeQnua8-lwLL3vQEppbR2u6pfafqcLAQ:1783761877825&udm=2&tbs=rimg:CRbhCiO1x2jUYf9AdmAP5kHo4AIA&q=instagram+story+profile+image+picure+any+photos&sa=X&ved=2ahUKEwiZ_tvopsqVAxUZyzgGHbsOB7IQuIIBegQIOBAA&biw=1366&bih=633&dpr=1#sv=CAMSURoyKhBlLTM5d01CZUgzSEZndmRNMg4zOXdNQmVIM0hGZ3ZkTToOb1dqZ0szSVFZWnRUeU0gBCoXCgFzEhBlLTM5d01CZUgzSEZndmRNGAEwARgHIPC8hN8ISggQARgBIAEoAQ",
    "https://www.google.com/search?tbnid=FuEKI7XHaNTA0M&tbnh=0&tbnw=0&sca_esv=5c160724a155473c&cs=0&sxsrf=APpeQnua8-lwLL3vQEppbR2u6pfafqcLAQ:1783761877825&udm=2&tbs=rimg:CRbhCiO1x2jUYf9AdmAP5kHo4AIA&q=instagram+story+profile+image+picure+any+photos&sa=X&ved=2ahUKEwiZ_tvopsqVAxUZyzgGHbsOB7IQuIIBegQIOBAA&biw=1366&bih=633&dpr=1#sv=CAMSURoyKhBlLUxEWWlWLWF4UHczVzNNMg5MRFlpVi1heFB3M1czTToOSUUzdDZJbU9XbWdmUU0gBCoXCgFzEhBlLUxEWWlWLWF4UHczVzNNGAEwARgHINz2-pYNSggQARgBIAEoAQ",
"https://www.google.com/search?tbnid=FuEKI7XHaNTA0M&tbnh=0&tbnw=0&sca_esv=5c160724a155473c&cs=0&sxsrf=APpeQnua8-lwLL3vQEppbR2u6pfafqcLAQ:1783761877825&udm=2&tbs=rimg:CRbhCiO1x2jUYf9AdmAP5kHo4AIA&q=instagram+story+profile+image+picure+any+photos&sa=X&ved=2ahUKEwiZ_tvopsqVAxUZyzgGHbsOB7IQuIIBegQIOBAA&biw=1366&bih=633&dpr=1#sv=CAMSURoyKhBlLTJndEdOdHdMeE8yRjJNMg4yZ3RHTnR3THhPMkYyTToOeEVFSFVTSHVoY0JtUE0gBCoXCgFzEhBlLTJndEdOdHdMeE8yRjJNGAEwARgHINPfkYwDSggQARgBIAEoAQ",
 "https://www.google.com/search?tbnid=FuEKI7XHaNTA0M&tbnh=0&tbnw=0&sca_esv=5c160724a155473c&cs=0&sxsrf=APpeQnua8-lwLL3vQEppbR2u6pfafqcLAQ:1783761877825&udm=2&tbs=rimg:CRbhCiO1x2jUYf9AdmAP5kHo4AIA&q=instagram+story+profile+image+picure+any+photos&sa=X&ved=2ahUKEwiZ_tvopsqVAxUZyzgGHbsOB7IQuIIBegQIOBAA&biw=1366&bih=633&dpr=1#sv=CAMSURoyKhBlLUMybWxyTTZuU25jckZNMg5DMm1sck02blNuY3JGTToONmFZNDUwUW5GWFdCRU0gBCoXCgFzEhBlLUMybWxyTTZuU25jckZNGAEwARgHIIWK6tMDSggQARgBIAEoAQ",
    "https://www.google.com/search?tbnid=FuEKI7XHaNTA0M&tbnh=0&tbnw=0&sca_esv=5c160724a155473c&cs=0&sxsrf=APpeQnua8-lwLL3vQEppbR2u6pfafqcLAQ:1783761877825&udm=2&tbs=rimg:CRbhCiO1x2jUYf9AdmAP5kHo4AIA&q=instagram+story+profile+image+picure+any+photos&sa=X&ved=2ahUKEwiZ_tvopsqVAxUZyzgGHbsOB7IQuIIBegQIOBAA&biw=1366&bih=633&dpr=1#sv=CAMSURoyKhBlLWdFR0VwRnhpSW14NzZNMg5nRUdFcEZ4aUlteDc2TToONGp1OEtfOG1wSGtFVE0gBCoXCgFzEhBlLWdFR0VwRnhpSW14NzZNGAEwARgHIPDbzMMOSggQARgBIAEoAQ",
  ];
}