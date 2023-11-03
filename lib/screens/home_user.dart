import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerec/const.dart';
import 'package:e_commerec/firebase_data/model.dart';
import 'package:e_commerec/screens/login_screen.dart';
import 'package:e_commerec/screens/user_screen/baby.dart';
import 'package:e_commerec/screens/user_screen/car.dart';
import 'package:e_commerec/screens/user_screen/kids.dart';
import 'package:e_commerec/screens/user_screen/love.dart';
import 'package:e_commerec/screens/user_screen/man.dart';
import 'package:e_commerec/screens/user_screen/user_formation.dart';
import 'package:e_commerec/screens/user_screen/woman.dart';
import 'package:e_commerec/statemanagement/cachehelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../firebase_data/firebase_user.dart';

class home_user extends StatelessWidget {
  static const String routname ='home_user';

  @override
  Widget build(BuildContext context) {
    String? email_user_singin =FirebaseAuth.instance.currentUser!.email;
    return StreamBuilder<QuerySnapshot<users>>(
      stream: getuserFirebaseFirestore(email_user_singin!),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return Center(child: Text("Something Went Wronge"));
        }
        var user = snapshot.data?.docs.map((doc) => doc.data()).toList()??[];
        if(user.isEmpty){
          return Center(child: Text("No Data"));
        }
        print(user.single.id);
        cache_helper.putid(key: "uId", value:user.single.id);
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Kmaincolor),
              backgroundColor:Colors.grey.shade200,
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Kmaincolor,
                indicatorWeight: 5,
                tabs: [
                  Tab(child: Text("WOMAN",style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'Pacifico'),),),
                  Tab(child: Text("MAN",style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'Pacifico'),),),
                  Tab(child: Text("KIDS",style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'Pacifico'),),),
                  Tab(child: Text("BABY",style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'Pacifico'),),),
                ],
              ),
              title: Text('BUYIT',style: TextStyle(fontSize: 20,color: Kmaincolor,fontFamily: 'Pacifico')),
              actions: [
                IconButton(onPressed: ()async {
                    await cache_helper.deleteid().then((value) {
                      Navigator.pushNamed(context, login.routname);
                    });
                }, icon: Icon(Icons.output)),
                IconButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, love.routname,
                      arguments: displayss("", "", user.single.id)
                  );
                }, icon: Icon(CupertinoIcons.heart)),
                IconButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, car.routname,
                    arguments: displayss("", "", user.single.id)
                  );
                }, icon: Icon(CupertinoIcons.bag)),
              ],
            ),
            body: TabBarView(
              children: [
                woman(user.single.id),
                man(user.single.id),
                baby(user.single.id),
                kids(user.single.id),
              ],
            ),
          ),
        );
      }
    );
  }
}
