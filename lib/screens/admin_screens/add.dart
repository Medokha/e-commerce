import 'package:e_commerec/const.dart';
import 'package:e_commerec/firebase_data/model.dart';
import 'package:e_commerec/providers/log_provider.dart';
import 'package:e_commerec/screens/homepage_admin.dart';
import 'package:e_commerec/statemanagement/get-cubit.dart';
import 'package:e_commerec/statemanagement/get-states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../firebase_data/firebase_utils.dart';

class add extends StatefulWidget {
  static const String routname ='add';

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
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
    return BlocProvider(
      create: (BuildContext context) =>getcubit(),
      child: BlocConsumer<getcubit,getstates>(
        listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, state) {
          return ModalProgressHUD(
            inAsyncCall: pro.saving,
            child: Scaffold(
              backgroundColor: Kmaincolor,
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, home_admain.routname);
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
                          hintText: 'Name product',
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
                          hintText: 'Enter Description',
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
                      // TextFormField(
                      //   controller: category,
                      //   cursorColor: Kmaincolor,
                      //   decoration: InputDecoration(
                      //     hintText: 'Name Category',
                      //     prefixIcon: Icon(Icons.category),
                      //     iconColor: Kmaincolor,
                      //     filled: true,
                      //     fillColor: Ksecondcolor,
                      //     prefixIconColor: Kmaincolor,
                      //     focusedBorder:OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         borderSide: BorderSide(color: Colors.white)
                      //     ) ,
                      //     enabledBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         borderSide: BorderSide(color: Colors.white)
                      //     ),
                      //     border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         borderSide: BorderSide(color: Colors.white)
                      //     ),
                      //     errorBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         borderSide: BorderSide(color: Colors.red)
                      //     ),
                      //
                      //   ),
                      //   validator: (value){
                      //     if(value!.isEmpty){
                      //       return 'Enter Category';
                      //     }
                      //     return null;
                      //   },
                      // ),
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
                              initialSelection: list.first,
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
                              initialSelection: list2.first,
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
                              initialSelection: list3.first,
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
                          hintText: 'Enter Price',
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
                          hintText:getcubit.get(context).imageurl==''? 'Enter photo':getcubit.get(context).imageurl,
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
                              name: name.text,
                              description: description.text,
                              category: _maincayegory.text,
                              secondcategory: _secondcayegory.text,
                              image: getcubit.get(context).imageurl,
                              card: _cards.text,
                              price: price.text);
                          addtaskFirebaseFirestore(new_product);
                          pro.change_clicked();
                        },
                        child: Text("Add_Product",style: TextStyle(fontSize: 20,color: Colors.white)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  List<String> list;
  String dropdownValue ;
  DropdownMenuExample(this.list,this.dropdownValue);
  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState(list, dropdownValue);
}
class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  TextEditingController _maincayegory =TextEditingController();
  List<String> list;
  String dropdownValue ;
  _DropdownMenuExampleState(this.list,this.dropdownValue);
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
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
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
