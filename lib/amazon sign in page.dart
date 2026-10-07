import 'package:amazon/AMAZON2.0.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'amazonloginpage.dart';
class amazonsingingpage extends StatefulWidget {
  const amazonsingingpage({super.key});

  @override
  State<amazonsingingpage> createState() => _amazonsingingpageState();
}

class _amazonsingingpageState extends State<amazonsingingpage> {
   FirebaseAuth auth=FirebaseAuth.instance;
  final _formKey =GlobalKey<FormState>();
  final TextEditingController usernameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sing in ",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),),centerTitle: true,
      ),
      body:
      Form(
        key: _formKey,
     child:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "user name",
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if(value==null||value.isEmpty){
                  return "please enter username";
                }if(value.length<3){
                  return "user most be at least 3 characters";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "email id ",
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return "please enter email";
                }if(!RegExp(  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',).hasMatch(value)){
                  return "please enter a valid email";
                }
                return null;
                },

            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Create password",
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return "please enter password";
                }if(value.length<6){
                  return "Password must be at least 6 characters";
                }return null;
              },
            ),
          ),SizedBox(height: 25,),
          ElevatedButton(onPressed: () async{
    if (_formKey.currentState!.validate()) {
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email:
            emailController.text.trim(), password: passwordController.text.trim());
        print("Account created: ${emailController.text}");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>amazonloginpage()));
      }on FirebaseAuthException catch (e){
        if(e=="email already in use"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email already registered")));
        }else if(e=="weak password"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password is to weak")));
        }else if(e=="invalid email"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("invalid email")));
        }
      }

    }
    },child: Text("Create new account"),),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>amazonloginpage()));
          }, child: Text("Login"))
        ],
      ),
      )
    );
  }
}
