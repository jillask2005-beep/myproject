import 'dart:math';

import 'package:flutter/material.dart';
class friday extends StatefulWidget {
  const friday({super.key});

  @override
  State<friday> createState() => _fridayState();
}

class _fridayState extends State<friday> {
  int currentStep=0;
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController streetController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController pincodeController=TextEditingController();
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("Registration form"),
),
      body: Form(
        key:formKey,child: Stepper(currentStep: currentStep,
      onStepContinue: (){
          if(currentStep<2){
            setState(() {
              currentStep++;
            });
          }
      },
      onStepTapped: (step){
          setState(() {
            currentStep=step;
          });
      },
        steps: [
          Step(title: Text("personal info"), content: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Full name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: mobileController,
                decoration: InputDecoration(
                  labelText: "Enter your Mobile number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              
            ],
          )),
          Step(title: Text("Address"), content: Column(
            children: [
              TextFormField(
                controller: streetController,
                decoration: InputDecoration(
                  hintText: "Street",
                  prefixIcon: Icon(Icons.home),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                  labelText: "city",
                  prefixIcon: Icon(Icons.location_city),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: pincodeController,
                decoration: InputDecoration(
                  hintText: "pin code",
                  prefixIcon: Icon(Icons.pin_drop),
                  border: OutlineInputBorder(),
                ),
              ),

            ],
          )),
          Step(title: Text("Review & Submit"), content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("personal Information",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10,),
              Text("Address detail",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
              SizedBox(width:double.infinity,
              child:ElevatedButton(onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("From Submit Successfully")));
              }, child: Text("Summit"),
                ))
            ],
          ))
        ],
      ),
      ),
    );
  }
}
