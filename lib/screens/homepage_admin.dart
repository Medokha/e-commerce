import 'package:e_commerec/const.dart';
import 'package:e_commerec/screens/admin_screens/edit.dart';
import 'package:e_commerec/screens/admin_screens/orders.dart';
import 'package:e_commerec/screens/admin_screens/view.dart';
import 'package:e_commerec/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerec/screens/admin_screens/add.dart';

class home_admain extends StatelessWidget {
  static const String routname ='home_admain';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Kmaincolor,
      body: Column(
        children: [
          SafeArea(child: Container()),
          Text("Dashbord",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 70,),
          Expanded(child: ElevatedButton(onPressed: (){
            Navigator.pushNamed(context,add.routname);
          }, child: Text("Add Product",style: TextStyle(fontSize: 25,color: Colors.white)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),)),
          SizedBox(height: 70,),
          Expanded(child: ElevatedButton(onPressed: (){
            Navigator.pushNamed(context,edit.routname);

          }, child: Text("Edit Product",style: TextStyle(fontSize: 25,color: Colors.white)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),)),
          SizedBox(height: 70,),
          Expanded(child: ElevatedButton(onPressed: (){
            Navigator.pushNamed(context,view.routname);

          }, child: Text("View Products",style: TextStyle(fontSize: 25,color: Colors.white)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),)),
          SizedBox(height: 70,),
          Expanded(child: ElevatedButton(onPressed: (){
            Navigator.pushNamed(context,orderss.routname);

          }, child: Text("View orders",style: TextStyle(fontSize: 25,color: Colors.white)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),)),
          SizedBox(height: 70,),
          Expanded(child: ElevatedButton(onPressed: (){
            Navigator.pushReplacementNamed(context,login.routname);

          }, child: Text("Log_out",style: TextStyle(fontSize: 25,color: Colors.white)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),)),
          SizedBox(height: 70,),

        ],
      ),
    );
  }
}
