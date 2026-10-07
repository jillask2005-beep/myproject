import 'package:flutter/material.dart';
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController displayText=TextEditingController();
  String n1="";
  String n2="";
  String operator="";
  String output=' ';
  bool isClicked=false;   //for operator click initially

  double result=0;

  numberClick(value){
    setState(() {
      if(isClicked){
        n1=value;
        displayText.text+=n1;
      }
      else{
        n2=value;
        displayText.text+=n2;
      }
    });
  }

  operatorClick(value){
    switch(value){
      case"-":
        {
          isClicked = true;
          operator= value;
          setState(() {
            displayText.text=operator;
          });
        }
    }
    switch(value) {
      case "+":
        {
          isClicked = true;
          operator = value;
          setState(() {
            displayText.text = operator;
          });
        }

      case "=":{
          double a=double.parse(n1);
          double b=double.parse(n2);
          if(operator=="+"){
            result=a+b;
          }
          else if(operator=="-"){
            result=a-b;
          }
          setState(() {
            displayText.text=result.toString();
          });

        }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.calculate_sharp),
        title: Text("Calculator"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(Icons.minimize),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(Icons.crop_square_sharp),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(Icons.cancel),
          ),
        ],
      ),
      body: Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  height: 60,
                  width: 980,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: displayText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(

                      ),
                      hintText: "0",
                      hintStyle: TextStyle(fontSize:20,fontWeight: FontWeight.bold,),
                    ),
                    textAlign: TextAlign.right,
                  )
                ),
              ),

            ),
            SizedBox(height: 20,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     //Buttons("7"),
                    ElevatedButton(onPressed: (){
                      numberClick("7");
                    },
                        child: Text("7",style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white60,
                            fixedSize: Size(80,50 ) ,
                            shape:RoundedRectangleBorder()
                        ),
                    ),
                    ElevatedButton(onPressed: (){
                      numberClick("8");
                    },
                      child: Text("8",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      numberClick("9");
                    },
                      child: Text("9",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      operatorClick("%");
                    },
                      child: Text("%",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                    ],
                ),
                SizedBox(height:20 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                      numberClick("4");
                    },
                      child: Text("4",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      numberClick("5");
                    },
                      child: Text("5",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      numberClick("6");
                    },
                      child: Text("6",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      operatorClick("*");
                    },
                      child: Text("*",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                      numberClick("1");
                    },
                      child: Text("1",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      numberClick("2");
                    },
                      child: Text("2",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      numberClick("3");
                    },
                      child: Text("3",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      operatorClick("-");
                    },
                      child: Text("-",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                  ],
                ),
                SizedBox(height:20 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                      setState(() {
                        displayText.clear();
                      });
                      operatorClick("C");
                    },
                      child: Text("C",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      numberClick("0");
                    },
                      child: Text("0",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      operatorClick("=");
                    },
                      child: Text("=",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      operatorClick("+");
                    },
                      child: Text("+",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                      numberClick("x²");
                    },
                      child: Text("x²",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(80,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      numberClick("2√x");
                    },
                      child: Text("2√x",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          fixedSize: Size(90,50 ) ,
                          shape:RoundedRectangleBorder()
                      ),
                    ),
              ],
            )
                ],
              ),
      ],
      ),
    ),
    );
  }
}

// Widget Buttons(String num){
//   return  ElevatedButton(onPressed: (){
//        if(num=="+" || num=="-" || num=="*" || num =="%"|| num=="="){
//          operatorClick(num);
//        }
//
//        else{
//          numberClick(num);
//        }
//   }, child: Text(num,style: TextStyle(fontSize: 20,
//       fontWeight: FontWeight.bold),),
//       style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.white60,
//       fixedSize: Size(80,50 ) ,
//       shape:RoundedRectangleBorder()
//     ),
//   );
// }
//
// void numberClick(String num) {
// }
//
// void operatorClick(String num) {
// }