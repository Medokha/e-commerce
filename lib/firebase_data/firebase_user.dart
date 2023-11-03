import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerec/firebase_data/model.dart';

CollectionReference<users> getusercollection(){
  return   FirebaseFirestore.instance.collection('users').
  withConverter<users>(
      fromFirestore: (Snapshot,_)=>users.fromFirestore(Snapshot.data()!),
      toFirestore: (user,_)=>user.toFirestore());
}

Future<void> adduserFirebaseFirestore(users user){
  var collection =getusercollection();
  var dcoref =collection.doc();
  user.id= dcoref.id;
  return dcoref.set(user);

}
Stream<QuerySnapshot<users>> getuserFirebaseFirestore(String email){
  return getusercollection().where('mail', isEqualTo: email).snapshots();
}
Stream<QuerySnapshot<users>> getuserFirebaseFirestoreid(String id){
  return getusercollection().where('id', isEqualTo: id).snapshots();
}
CollectionReference<my_car> getcarcollection(String user_id){
  return   FirebaseFirestore.instance.collection('users').doc(user_id).collection("car").
  withConverter<my_car>(
      fromFirestore: (Snapshot,_)=>my_car.fromFirestore(Snapshot.data()!),
      toFirestore: (my_car,_)=>my_car.toFirestore());
}

Future<void> addcarFirebaseFirestore(my_car my_car,String user_id){
  var collection =getcarcollection(user_id);
  var dcoref =collection.doc();
  my_car.id= dcoref.id;
  return dcoref.set(my_car);

}
Stream<QuerySnapshot<my_car>> getcarFirebaseFirestore(String user_id){
  return getcarcollection(user_id).snapshots();
}

Future<void> deletecarFirebase(String id,String user_id){
  return getcarcollection(user_id).doc(id).delete();
}


CollectionReference<my_love> getlovecollection(String user_id){
  return   FirebaseFirestore.instance.collection('users').doc(user_id).collection("love").
  withConverter<my_love>(
      fromFirestore: (Snapshot,_)=>my_love.fromFirestore(Snapshot.data()!),
      toFirestore: (my_love,_)=>my_love.toFirestore());
}

Future<void> addloveFirebaseFirestore(my_love my_love,String user_id){
  var collection =getlovecollection(user_id);
  var dcoref =collection.doc();
  my_love.id= dcoref.id;
  return dcoref.set(my_love);

}
Stream<QuerySnapshot<my_love>> getloveFirebaseFirestore(String user_id){
  return getlovecollection(user_id).snapshots();
}

Future<void> deleteloveFirebase(String id,String user_id){
  return getlovecollection(user_id).doc(id).delete();
}
