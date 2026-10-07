import 'package:flutter/material.dart';
class gst extends StatefulWidget {
  const gst({super.key});

  @override
  State<gst> createState() => _gstState();
}

class _gstState extends State<gst> {
  final TextEditingController amountcontroller=TextEditingController();
  double gstRate=18;
  String gstAmount ="0.00";
  String totalAmount ="0.00";
  void calculateInclusive(){
    double amount = double.tryParse(amountcontroller.text)??0;
    double gst =amount*gstRate/(100+gstRate);
    double basePrice=amount-gst;
    setState(() {
      gstAmount=gst.toStringAsFixed(2);
      totalAmount=  basePrice.toStringAsFixed(2);
    });

  }
  void calculateExclusive(){
    double amount=double.tryParse(amountcontroller.text)??0;
    double gst =amount*gstRate/100;
    double total = amount+gst;
    setState(() {
      gstAmount=gst.toStringAsFixed(2);
      totalAmount=total.toStringAsFixed(2);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GST calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: amountcontroller,
              decoration: InputDecoration(
                hintText: "price",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20,),

          DropdownButton<double>(
          value: gstRate,
          onChanged: (value){
            setState(() {
              gstRate=value!;
            });
          },
          items: [
            DropdownMenuItem(value: 3,child: Text("0%"),),
    DropdownMenuItem(value:12,child:Text("12%") ),
    DropdownMenuItem(value:18,child: Text("18")),
    DropdownMenuItem(value:24,child: Text("24")),
    ],
    ),
          SizedBox(height: 20,),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed:
                    calculateInclusive, child: Text("inclusive")),
                  ),
                  Spacer(),
                  ElevatedButton(onPressed: calculateExclusive, child: Text("Exclusive")),
                ],
              ),
              SizedBox(height: 20,),
              Text("GST Amount :$gstAmount"),
              SizedBox(height: 10,),
              Text("base Price :$totalAmount")
            ],
          )
  ],
      ),
    );
  }
}
