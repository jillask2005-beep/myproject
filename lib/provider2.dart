import 'package:amazon/counterpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class pro extends StatefulWidget {
  const pro({super.key});

  @override
  State<pro> createState() => _proState();
}

class _proState extends State<pro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
     title: Text("plus page"),
   ),
      body: Consumer<CounterProvider>( builder: (context, provider, child){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${provider.count}"),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                provider.increment();
              }, child: Text("+")),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Back"))
            ],
          ),
        );
      }
      )
    );
  }
}
