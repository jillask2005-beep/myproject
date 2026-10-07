import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class picker extends StatefulWidget {
  const picker({super.key});

  @override
  State<picker> createState() => _pickerState();
}

class _pickerState extends State<picker> {
  File? image;
  final ImagePicker picker=ImagePicker();
  Future<void>pickImageFormGallery()async{
    final XFile ? pickedFile=
        await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile !=null){
      setState(() {
     image =File(pickedFile.path);
      });
    }
  }
  Future<void>pickImageFormCamera()async{
    final XFile ? pickedFile=
        await picker.pickImage(source: ImageSource.camera);
    if (pickedFile !=null){
      setState(() {
        image=File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("image picker"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image !=null  ?
                CircleAvatar(
                  radius: 80,
                  backgroundImage: FileImage(image!),
                ):
                CircleAvatar(
                  radius: 80,
                  child: Icon(Icons.person,size: 80,),
                ),
            SizedBox(height: 10,),
            ElevatedButton .icon(onPressed: pickImageFormGallery,icon: Icon(Icons.photo), label:Text("picket Form Gallery"), ),
          SizedBox(
            height: 15,
          ),
            ElevatedButton.icon(onPressed: pickImageFormCamera,icon: Icon(Icons.camera_alt), label: Text("open camera"),),
          ],
        ),
      ),
    );
  }
}
