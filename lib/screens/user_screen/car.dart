import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerec/firebase_data/model.dart';
import 'package:e_commerec/screens/home_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../const.dart';
import '../../firebase_data/firebase_user.dart';
import '../../firebase_data/firebase_utils.dart';

class car extends StatelessWidget {
  static const String routname ='car';
  int total_price =0;
  @override
  Widget build(BuildContext context) {
    displayss res =ModalRoute.of(context)?.settings.arguments as displayss;
    List<product> products=[];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushReplacementNamed(context, home_user.routname);
        },
        child: Icon(CupertinoIcons.back,color: Kmaincolor,),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<my_car>>(
                stream: getcarFirebaseFirestore(res.user_id),
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  if(snapshot.hasError){
                    return Center(child: Text("Something Went Wronge"));
                  }
                  var cars = snapshot.data?.docs.map((doc) => doc.data()).toList()??[];
                  if(cars.isEmpty){
                    return Center(child: Text("No Data"));
                  }
                  return ListView.builder(
                    itemCount: cars.length,
                    itemBuilder: (BuildContext context, int index) {
                      return StreamBuilder<QuerySnapshot<product>>(
                          stream: gettaskFirebaseFirestorebyid(cars[index].id_product),
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
                                total_price= int.parse(products[index].price) + total_price;
                                products.add(products[index]);
                                return  item_row(context,cars[index],products[index],res.user_id);
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(height: 6,);
                              },
                              itemCount: products.length,
                            );
                          }
                      );
                    },
                  );
                }
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*.5,
            height: MediaQuery.of(context).size.height*.05,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Kmaincolor)),
                onPressed: (){
                order new_order =order(id_user: res.user_id, total_price: total_price.toString());
                showDialog(
                    context: context
                  , builder: (BuildContext context) {
                  return AlertDialog(
                      title: const Text('Make order'),
                      actions: <Widget>[
                        ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Kmaincolor)),
                            onPressed: (){
                          addorderFirebaseFirestore(new_order);
                          Navigator.of(context).pop();
                        }, child: Text("Ok",style: TextStyle(fontSize: 20,color: Colors.black),)),
                        ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Canel",style: TextStyle(fontSize: 20,color: Colors.black),))

                      ]
                  );
                },
                );

                }, child: Text("order",style: TextStyle(fontSize: 20,color: Colors.black),)),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
  Widget item_row (context ,my_car car,product product,String user_id)=>Padding(
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
                deletecarFirebase(car.id,user_id);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
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
                Text("${product.price}\$",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Kmaincolor),),

              ],
            ),
            SizedBox(width: 15,),
          ],
        ),
      ),
    ),
  );
  Widget row_new_items (context ,product product)=>Card(
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
              alignment: Alignment.topRight,
              child: IconButton(onPressed: (){

              }, icon: Icon(CupertinoIcons.heart,color: Colors.red,size: 30,)))


        ],
      ),
    ),
  );

}
