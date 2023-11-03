import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerec/screens/homepage_admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../const.dart';
import '../../firebase_data/firebase_user.dart';
import '../../firebase_data/firebase_utils.dart';
import '../../firebase_data/model.dart';

class orderss extends StatelessWidget {
  static const String routname ="orders";
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
              StreamBuilder<QuerySnapshot<order>>(
                  stream: getorderFirebaseFirestore(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }
                    if(snapshot.hasError){
                      return Center(child: Text("Something Went Wronge"));
                    }
                    var ord = snapshot.data?.docs.map((doc) => doc.data()).toList()??[];
                    if(ord.isEmpty){
                      return Center(child: Text("No Data"));
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return  StreamBuilder<QuerySnapshot<users>>(
                            stream: getuserFirebaseFirestoreid(ord[index].id_user),
                            builder: (context, snapshot) {
                              if(snapshot.connectionState==ConnectionState.waiting){
                                return Center(child: CircularProgressIndicator());
                              }
                              if(snapshot.hasError){
                                return Center(child: Text("Something Went Wronge"));
                              }
                              var users = snapshot.data?.docs.map((doc) => doc.data()).toList()??[];
                              if(users.isEmpty){
                                return Center(child: Text("No Data"));
                              }
                              return ListView.separated(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return row_items(context,ord[index],users[index]);
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return SizedBox(height: 6,);
                                },
                                itemCount: users.length,
                              );
                            }
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 5,);
                      },
                      itemCount: ord.length,
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget row_items (context ,order ord,users user)=>Slidable(
    startActionPane: ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context){
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.cancel,
          label: 'Cancel',
        ),
      ],
    ),
    endActionPane:ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context){
          },
          backgroundColor: Color(0xFF0392CF),
          foregroundColor: Colors.white,
          icon: Icons.done,
          label: 'Accept',
        ),
      ],
    ) ,
    child: Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: Ksecondcolor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 30,),
          Expanded(child: Text("${user.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black))),
          Column(
            children: [
              Text("price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Kmaincolor),),
              Text("${ord.total_price} \$",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Kmaincolor),),

            ],
          ),
          SizedBox(width: 30,),


        ],
      ),
    ),
  );

}
