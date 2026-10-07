import 'package:flutter/material.dart';
class CounterProvider extends ChangeNotifier{
  String name=" hello srikanth";
  int count=0;
  void increment(){
    count++;
    notifyListeners();
  }
  void decrement(){
    count--;
    notifyListeners();
  }
}
