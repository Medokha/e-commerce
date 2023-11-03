import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerec/firebase_data/firebase_utils.dart';
import 'package:e_commerec/firebase_data/model.dart';
import 'package:e_commerec/screens/admin_screens/edit_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerec/screens/homepage_admin.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../const.dart';

class edit extends StatelessWidget {
  static const String routname ='edit';
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
      body: SingleChildScrollView(
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
                      return  item_row(context,products[index]);
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
    );
  }
  Widget item_row (context ,product product)=>Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: Ksecondcolor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context){
                deletetaskFirebase(product.id );
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        endActionPane:ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context){
                Navigator.pushNamed(context, edit_details.routname
                    ,arguments:product.id );
              },
              backgroundColor: Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ) ,
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
                Text("${product.price}\$",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Kmaincolor),),

              ],
            ),
            SizedBox(width: 15,),
          ],
        ),
      ),
    ),
  );
}
