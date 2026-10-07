import 'package:amazon/counterpage.dart';
import 'package:amazon/provider2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class provider extends StatefulWidget {
  const provider({super.key});

  @override
  State<provider> createState() => _providerState();
}

class _providerState extends State<provider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Counter"),
        centerTitle: true,
      ),
      body: Consumer<CounterProvider>(
        builder: (context,provider,child){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(provider.name)
                ,SizedBox(height: 20,),
                Text("${provider.count}"),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  provider.decrement();
                }, child: Text("-")),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>pro()));
                }, child:Text("Next page") )
              ],
            ),
          );
        },
      ),
    );
  }
}
