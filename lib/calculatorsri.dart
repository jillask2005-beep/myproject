    import 'dart:math';

import 'package:flutter/material.dart';
    class calculatorsri extends StatefulWidget {
      const calculatorsri({super.key});

      @override
      State<calculatorsri> createState() => _calculatorsriState();
    }

    class _calculatorsriState extends State<calculatorsri> {
      TextEditingController displayText=TextEditingController();
      String num1="";
      String num2="";
      String operator="";
      bool operatorClicked=false;

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: displayText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(

                    ),
                    hintText: "0",
                    hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),

                  ),
                ),
              ),
              SizedBox(height: 10,),
              Column(
                children: [
                  Row(
                    children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    num1="";
                    num2="";
                    operator="";
                    operatorClicked= false;
                    displayText.clear();
                  });
                }, child: Text("AC")),
                      ElevatedButton(onPressed: (){
                        if(!operatorClicked){
                          if(num1.isNotEmpty){
                            num1= num1.substring( 0, num1.length-1);
                            displayText.text=num1;

                          }
                        }
                        else {
                          if(num2.isNotEmpty){
                            num2=num2.substring(0, num2.length -1);
                              displayText.text= num2;
                            }

                          }
                      }, child: Text("⌫")),
                      ElevatedButton(onPressed: (){
                        if(!operatorClicked && num1.isNotEmpty){
                          double a= double.parse(num1);
                          double result =a*a;
                          displayText.text=result.toString();
                          num1 = result.toString();
                        }
                        else if(operatorClicked && num1.isNotEmpty){
                          double b= double.parse(num2);
                          double result = b*b;
                          displayText.text=result.toString();
                          num2=result.toString();
                        }
                      }, child: Text("x²")),
                      ElevatedButton(onPressed: (){
                        if(!operatorClicked && num1.isNotEmpty){
                          double a= double.parse(num1);
                          double result= sqrt(a);
                          displayText.text=result.toString();
                          num1=result.toString();
                        }
                        else if(operatorClicked && num2.isNotEmpty){
                          double b= double.parse(num2);
                          double result= sqrt(b);
                          displayText.text=result.toString();
                          num2= result.toString();

                        }
                      }, child: Text("√"))
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(onPressed: (){
                       if(!operatorClicked){

                         num1+="1";
                         displayText.text=num1;
                         print("num 1 is: $displayText");
                       }
                       else{
                         num2+="1";
                         displayText.text=num2;
                         print("num 2 is: $displayText");
                       }
                    }, child: Text("1"),),
                    ElevatedButton(onPressed: (){
                      if(!operatorClicked){
                        num1+="2";
                        displayText.text=num1;
                        print("num 1 is: $displayText");
                      }
                      else{
                        num2+="2";
                        displayText.text=num2;
                        print("num 2 is: $displayText");                  }
                    }, child: Text("2"),),
                    ElevatedButton(onPressed: (){
                      if(!operatorClicked){
                        num1+="3";
                        displayText.text=num1;
                        print("num 1 is: $displayText");
                      }
                      else{
                        num2+="3";
                        displayText.text=num2;
                        print("num 3 is:$displayText");
                      }
                    },

                      child: Text("3"),),
                    ElevatedButton(onPressed: (){
                      if(!operatorClicked){
                        num1+="4";
                        displayText.text=num1;
                        print("num 1 is :$displayText");
                      }
                      else {
                        num2+="4";
                        displayText.text=num2;
                        print("num 2 is:$displayText");
                      }
                    }, child: Text("4"),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(onPressed: (){
                      if(!operatorClicked){
                        num1+="5";
                        displayText.text=num1;
                        print("num 1 is:$displayText");
                      }
                      else {
                        num2+="5";
                        displayText.text=num2;
                        print("num2 is: $displayText");
                      }
                    }, child: Text("5")),
                    ElevatedButton(onPressed: (){
                      if(!operatorClicked){
                        num1+="6";
                        displayText.text=num1;
                        print("num1 is:$displayText ");
                      }
                      else{
                        num2+="6";
                        displayText.text=num2;
                        print("num1 is:$displayText");
                      }

                    }, child: Text("6")),
                    ElevatedButton(onPressed: (){
                      if(!operatorClicked){
                        num1+="7";
                        displayText.text=num1;
                        print("num1 is:$displayText");
                      }
                      else{
                        num2+="7";
                        displayText.text=num2;
                        print("num2 is:$displayText");

                      }
                    }, child: Text("7")),
                    ElevatedButton(onPressed: (){
                    if(!operatorClicked){
                      num1+="8";
                      displayText.text=num1;
                      print("num1 is:$displayText");

                    }
                    else{
                      num2+="8";
                      displayText.text=num2;
                      print("num2 is :$displayText");
                    }
                    }, child: Text("8")),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(onPressed: (){
                     if(!operatorClicked){
                       num1+="9";
                       displayText.text=num1;
                       print("num1 is:$displayText");
        }
                     else{
                       num2+="9";
                       displayText.text=num2;
                       print("num2 is : $displayText");
        }
                    }, child: Text("9")),
                    ElevatedButton(onPressed: (){
                      if(!operatorClicked){
                        num1+="0";
                        displayText.text=num1;
                        print("num1 is :$displayText");
                      }
                      else{
                        num2+="0";
                        displayText.text=num2;
                        print("num2 is:$displayText");
                      }
                    }, child: Text("0")),
                    ElevatedButton(onPressed: (){
                      operator="+";
                      displayText.text=operator;
                      operatorClicked=true;
                    }, child: Text("+")),
                    ElevatedButton(onPressed: (){
                      operator="-";
                      displayText.text=operator;
                      operatorClicked=true;

                    }, child: Text("-")),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(onPressed: (){
                      double a=double.parse(num1);
                      double b=double.parse(num2);
                      if(num1.isNotEmpty && num2.isNotEmpty && operator=="+"){
                        double sum=a+b;
                        displayText.text=sum.toString();
                      }
                      else if(num1.isNotEmpty && num2.isNotEmpty && operator=="-"){
        double sum=a-b;
        displayText.text=sum.toString();
        }else if(num1 .isNotEmpty && num2.isNotEmpty && operator=="*"){
                        double sum=a*b;
                        displayText.text=sum.toString();
                      }
                      else if(num1.isNotEmpty && num2.isNotEmpty && operator=="%"){
                        double sum=a%b;
                        displayText.text=sum.toString();
                      }
                    }, child: Text("=")),
                    ElevatedButton(onPressed: (){
                      operator="%";
                      displayText.text="%";
                      operatorClicked=true;
                    }, child: Text("%")),
                    ElevatedButton(onPressed: (){
                      operator="*";
                      displayText.text="*";
                      operatorClicked= true;
                    }, child: Text("*")),
                    ElevatedButton(onPressed: (){
                      if(!operatorClicked){
                        num1+=".";
                        displayText.text=num1;
                        print("num1 is :$displayText");
                      }
                      else num2+=".";
                      displayText.text=num1;
                      print("num1 is$displayText");
                    }, child: Text("."))
                  ],
                ),
              )
            ],
          ),
        );
      }
    }
