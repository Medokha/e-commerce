import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerec/firebase_data/model.dart';
import 'package:e_commerec/screens/home_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const.dart';
import '../../firebase_data/firebase_user.dart';
import '../../firebase_data/firebase_utils.dart';

class display extends StatelessWidget {
  static const String routname='display';
  @override
  Widget build(BuildContext context) {
    displayss result =ModalRoute.of(context)?.settings.arguments as displayss;
  return Scaffold(
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () {
        Navigator.pushReplacementNamed(context, home_user.routname);
      },
      child: Icon(CupertinoIcons.back,color: Kmaincolor,),
    ),
    body: StreamBuilder<QuerySnapshot<product>>(
          stream: gettaskFirebaseFirestorebycat(result.maincat,result.secondcat),
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
            return GridView(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: <Widget>[
            ListView.separated(
            shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return  row_new_items(context,products[index],result.user_id);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 5,);
              },
              itemCount: products.length,
            ),
              ],
            );
          }
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
  Widget row_new_items (context ,product product,String id_user)=>Card(
    elevation: 20,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(
            height: 180,
            width: double.infinity,
            image: NetworkImage("${product.image}"),fit: BoxFit.fill,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white.withOpacity(.5),
              width: double.infinity,
              height: 70,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("${product.name}",style: TextStyle(fontSize: 20,color: Colors.black),),
                      Text("${product.price} \$",style: TextStyle(fontSize: 20,color: Colors.black),),
                    ],
                  )


                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight:Radius.circular(18) )
                  ),
                  child: ElevatedButton(onPressed: (){
                    my_car new_car =my_car(id_product: product.id, count: "1");
                    addcarFirebaseFirestore(new_car,id_user);
                  }, child: Text("Add Car",style: TextStyle(color: Colors.black,fontSize: 18),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Kmaincolor)),))),
          Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: (){
                my_love new_love =my_love(id_product: product.id);
                addloveFirebaseFirestore(new_love,id_user);
              }, icon: Icon(CupertinoIcons.heart,color: Colors.red,size: 30,)))


        ],
      ),
    ),
  );

}
