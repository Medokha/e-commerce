import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerec/firebase_data/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerec/screens/homepage_admin.dart';
import '../../const.dart';
import '../../firebase_data/firebase_utils.dart';

class view extends StatelessWidget {
  static const String routname ='view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, home_admain.routname);
        },
        child: Icon(CupertinoIcons.back,color: Kmaincolor,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot<product>>(
                stream: gettaskFirebaseFirestore(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  if(snapshot.hasError){
                    return Center(child: Text("Something Went Wronge"));
                  }
                  var products = snapshot.data?.docs.map((doc) => doc.data()).toList()??[];
                  if(products.isEmpty){
                    return Center(child: Text("No Data"));
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return  row_items(context,products[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 5,);
                    },
                    itemCount: products.length,
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget row_items (context ,product product)=>Container(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(
        color: Ksecondcolor,
        borderRadius: BorderRadius.circular(20)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: MediaQuery.of(context).size.height*.15,
            width: MediaQuery.of(context).size.width*.4,
            child: Image(image: NetworkImage("${product.image}"),fit: BoxFit.cover,)),
        SizedBox(width: 15,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${product.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
              SizedBox(height: 15,),
              Text("${product.description}",style: TextStyle(fontSize: 18,color: Colors.black),),

            ],
          ),
        ) ,
        Column(
          children: [
            Text("price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Kmaincolor),),
            Text("${product.price} \$",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Kmaincolor),),

          ],
        ),
        SizedBox(width: 15,),


      ],
    ),
  );
}



