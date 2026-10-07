import 'package:amazon/AMAZON2.0.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'CommonBottomnavigation.dart';
class amazonloginpage extends StatefulWidget {
  const amazonloginpage({super.key});

  @override
  State<amazonloginpage> createState() => _amazonloginpageState();
}

class _amazonloginpageState extends State<amazonloginpage> {
  final emailController =TextEditingController();
  final passwordController=TextEditingController();
  Future<void> loginUser() async {
    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavbar(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message = "Login failed";
      if (e.code == "user-not-found") {
        message = "Email is not registered";
      }
      else if (e.code == "wrong-password" ||
          e.code == "invalid-credential") {
        message = "Incorrect email or password";
      }
      else if (e.code == "invalid-email") {
        message = "Enter a valid email";
      }
      else if (e.code == "too-many-requests") {
        message = "Too many login attempts";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email id",
                border: OutlineInputBorder(),
              ),
            ),
          ),SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 25,),
          ElevatedButton(
            onPressed: loginUser,
            child: const Text("Login"),
          )
        ],
      ),
    );
  }
}
