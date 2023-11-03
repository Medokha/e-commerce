
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerec/firebase_data/model.dart';
import 'package:flutter/material.dart';

CollectionReference<product> gettaskcollection(){
  return   FirebaseFirestore.instance.collection('product').
  withConverter<product>(
      fromFirestore: (Snapshot,_)=>product.fromFirestore(Snapshot.data()!),
      toFirestore: (product,_)=>product.toFirestore());
}

Future<void> addtaskFirebaseFirestore(product product){
  var collection =gettaskcollection();
  var dcoref =collection.doc();
  product.id= dcoref.id;
  return dcoref.set(product);

}

Stream<QuerySnapshot<product>> gettaskFirebaseFirestore(){
  return gettaskcollection().snapshots();
}

Stream<QuerySnapshot<product>> gettaskFirebaseFirestorebyid(String id){
  return gettaskcollection().where("id",isEqualTo: id).snapshots();
}
Stream<QuerySnapshot<product>> gettaskFirebaseFirestorebycat(String maincat,String secondcat){
  return gettaskcollection().where("category",isEqualTo: maincat ).where("secondcategory",isEqualTo: secondcat).snapshots();
}

Stream<QuerySnapshot<product>> gettaskFirebaseFirestorebycards(String maincat,String card){
  return gettaskcollection().where("category",isEqualTo: maincat ).where("card",isEqualTo: card).snapshots();
}

Future<void> deletetaskFirebase(String id){
  return gettaskcollection().doc(id).delete();
}
Future<void> updateiconFirebase(String id){
  return gettaskcollection().doc(id).update({
    "isdone" : true
  });
}
Future<void> updatedataFirebase(String id,product product){
  var taskmap = product.toFirestore();
  return gettaskcollection().doc(id).update(taskmap);
}




CollectionReference<order> getordercollection(){
  return   FirebaseFirestore.instance.collection('orders').
  withConverter<order>(
      fromFirestore: (Snapshot,_)=>order.fromFirestore(Snapshot.data()!),
      toFirestore: (orders,_)=>orders.toFirestore());
}

Future<void> addorderFirebaseFirestore(order orders){
  var collection =getordercollection();
  var dcoref =collection.doc();
  orders.id= dcoref.id;
  return dcoref.set(orders);

}
Stream<QuerySnapshot<order>> getorderFirebaseFirestore(){
  return getordercollection().snapshots();
}
