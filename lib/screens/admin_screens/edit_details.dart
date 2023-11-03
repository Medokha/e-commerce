import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerec/const.dart';
import 'package:e_commerec/firebase_data/model.dart';
import 'package:e_commerec/providers/log_provider.dart';
import 'package:e_commerec/screens/admin_screens/edit.dart';
import 'package:e_commerec/screens/homepage_admin.dart';
import 'package:e_commerec/statemanagement/get-cubit.dart';
import 'package:e_commerec/statemanagement/get-states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../firebase_data/firebase_utils.dart';

class edit_details extends StatefulWidget {
  static const String routname ='edit_details';

  @override
  State<edit_details> createState() => _edit_detailsState();
}

class _edit_detailsState extends State<edit_details> {
  TextEditingController name =TextEditingController();

  TextEditingController description =TextEditingController();

  TextEditingController category =TextEditingController();

  TextEditingController price =TextEditingController();

  TextEditingController image =TextEditingController();
  TextEditingController _maincayegory =TextEditingController();
  TextEditingController _secondcayegory =TextEditingController();
  TextEditingController _cards =TextEditingController();


  List<String> list = <String>['woman', 'man', 'baby', 'kids'];

  String dropdownValue = "woman";

  List<String> list2 = <String>[
    "Outerwear",
    "Jeans",
    "Sweashirt",
    "Tunic",
    "Dress",
    "DF fit",
    "Pullover",
    "Perfume",
    "T-shirt",
    "Blazer",
    "Trousers",
    "Shirt",
    "Cardigan",
    "Maternity",
    "Shoes",
    "Bags",
    "Underwear",
    "Homewear",
    "Biazer",
    "Jogger",
    "Licensed",
    "Sweatpants",
    "Pyjamas",
    "Set",
    "Socks",
    "Leggings",
    "Overalls",
    "Bodysuit",
    "Newborn",
  ];

  String dropdownValue2 = "Outerwear";
  List<String> list3 =[
    'DISCOUNT',
    'NEW ARRIVE',
    'BEST SELLER',
    'OLD COLLECTION',
  ];
  String dropdownValue3 = "DISCOUNT";

  final _key =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<provider_log>(context);
    String id_product =ModalRoute.of(context)?.settings.arguments as String;
    return BlocProvider(
      create: (BuildContext context) =>getcubit(),
      child: BlocConsumer<getcubit,getstates>(
        listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, state) {
          return StreamBuilder<QuerySnapshot<product>>(
              stream: gettaskFirebaseFirestorebyid(id_product),
              builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                if(snapshot.hasError){
                  return Center(child: Text("Something Went Wronge"));
                }
                var products = snapshot.data?.docs.map((doc) => doc.data()).toList()??[];
                print(products);
                if(products.isEmpty){
                  return Center(child: Text("No Data"));
                }
                return ModalProgressHUD(
                  inAsyncCall: pro.saving,
                  child: Scaffold(
                    backgroundColor: Kmaincolor,
                    floatingActionButton: FloatingActionButton(
                      backgroundColor: Colors.black,
                      onPressed: () {
                        Navigator.pushNamed(context, edit.routname);
                      },
                      child: Icon(CupertinoIcons.back,color: Kmaincolor,),
                    ),
                    body: Form(
                      key: _key,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            SafeArea(child: Container()),
                            SizedBox(height: 30,),
                            TextFormField(
                              controller: name,
                              cursorColor: Kmaincolor,
                              decoration: InputDecoration(
                                hintText: '${products.single.name}',
                                prefixIcon: Icon(Icons.text_rotation_none),
                                iconColor: Kmaincolor,
                                filled: true,
                                fillColor: Ksecondcolor,
                                prefixIconColor: Kmaincolor,
                                focusedBorder:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)
                                ) ,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.red)
                                ),

                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter Name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20,),
                            TextFormField(
                              controller: description,
                              cursorColor: Kmaincolor,
                              decoration: InputDecoration(
                                hintText: '${products.single.description}',
                                suffixIconColor: Kmaincolor,
                                prefixIcon: Icon(Icons.description),
                                iconColor: Kmaincolor,
                                filled: true,
                                fillColor: Ksecondcolor,
                                prefixIconColor: Kmaincolor,
                                focusedBorder:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)
                                ) ,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.red)
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty || value==null){
                                  return "Enter Description";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child:DropdownMenu<String>(
                                    controller: _maincayegory,
                                    inputDecorationTheme: InputDecorationTheme(

                                      filled: true,
                                      fillColor: Ksecondcolor,
                                      focusedBorder:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.white)
                                      ) ,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.white)
                                      ),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.red)
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.white)
                                      ),
                                    ),
                                    initialSelection: products.single.category,
                                    onSelected: (String? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        dropdownValue = value!;
                                      });
                                    },
                                    dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                                      return DropdownMenuEntry<String>(value: value, label: value);
                                    }).toList(),
                                  ),
                                ),
                                Container(
                                  child:DropdownMenu<String>(
                                    controller: _secondcayegory,
                                    inputDecorationTheme: InputDecorationTheme(
                                      filled: true,
                                      fillColor: Ksecondcolor,
                                      focusedBorder:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.white)
                                      ) ,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.white)
                                      ),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.red)
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.white)
                                      ),
                                    ),
                                    initialSelection: products.single.secondcategory,
                                    onSelected: (String? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        dropdownValue2 = value!;
                                      });
                                    },
                                    dropdownMenuEntries: list2.map<DropdownMenuEntry<String>>((String value) {
                                      return DropdownMenuEntry<String>(value: value, label: value);
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child:DropdownMenu<String>(
                                    controller: _cards,
                                    inputDecorationTheme: InputDecorationTheme(

                                      filled: true,
                                      fillColor: Ksecondcolor,
                                      focusedBorder:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.white)
                                      ) ,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.white)
                                      ),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.red)
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.white)
                                      ),
                                    ),
                                    initialSelection: products.single.category,
                                    onSelected: (String? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        dropdownValue3 = value!;
                                      });
                                    },
                                    dropdownMenuEntries: list3.map<DropdownMenuEntry<String>>((String value) {
                                      return DropdownMenuEntry<String>(value: value, label: value);
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            TextFormField(
                              controller: price,
                              cursorColor: Kmaincolor,
                              decoration: InputDecoration(
                                hintText: '${products.single.price}',
                                suffixIconColor: Kmaincolor,
                                prefixIcon: Icon(Icons.price_change),
                                iconColor: Kmaincolor,
                                filled: true,
                                fillColor: Ksecondcolor,
                                prefixIconColor: Kmaincolor,
                                focusedBorder:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)
                                ) ,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.red)
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty || value==null){
                                  return "Enter Price";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20,),
                            TextFormField(
                              controller: image,
                              cursorColor: Kmaincolor,
                              decoration: InputDecoration(
                                hintText:'${products.single.image}',
                                suffixIconColor: Kmaincolor,
                                prefixIcon: Icon(Icons.photo),
                                iconColor: Kmaincolor,
                                filled: true,
                                fillColor: Ksecondcolor,
                                prefixIconColor: Kmaincolor,
                                focusedBorder:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)
                                ) ,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.red)
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty || value==null){
                                  return "Enter photo";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20,),
                            ElevatedButton(
                              onPressed: (){
                                pro.change_clicked();
                                getcubit.get(context).uploodprofileimage();
                                image.text =getcubit.get(context).imageurl;
                                pro.change_clicked();

                              },
                              child: Text("Uplod_image",style: TextStyle(fontSize: 20,color: Colors.white)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),),
                            SizedBox(height: 20,),
                            ElevatedButton(
                              onPressed: (){
                                pro.change_clicked();
                                product new_product =product(
                                  id:products.single.id,
                                    name: name.text==''?products.single.name :name.text,
                                    description: description.text==''?products.single.description:description.text,
                                    category: _maincayegory.text==''?products.single.category:_maincayegory.text,
                                    card: _cards.text==''?products.single.card:_cards.text,
                                    secondcategory: _secondcayegory.text==''?products.single.secondcategory:_secondcayegory.text,
                                    image:getcubit.get(context).imageurl==products.single.image ?products.single.image: getcubit.get(context).imageurl,
                                    price: price.text==''?products.single.price:price.text);
                                updatedataFirebase(products.single.id,new_product);
                                pro.change_clicked();
                                Navigator.pushNamed(context, edit.routname);
                              },
                              child: Text("Edit_Product",style: TextStyle(fontSize: 20,color: Colors.white)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
