import 'package:e_commerec/const.dart';
import 'package:e_commerec/screens/user_screen/display.dart';
import 'package:e_commerec/screens/user_screen/display_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../firebase_data/model.dart';

class kids extends StatelessWidget {
  String id_user;
  kids(this.id_user);
  List<String> names =[
    "Outerwear",
    "Homewear",
    "Sweatpants",
    "Pullover",
    "Trousers",
    "T-shirt",
    "Pyjamas",
    "Set",
    "Shirt",
    "Cardigan",
    "Socks",
    "Shoes",
    "Bags",
  ];
  List<String> images =[
    "https://tse2.mm.bing.net/th?id=OIP.TGBWuT76m1-4T7RSknihcQHaHa&pid=Api&P=0&h=220",
    "https://tse4.mm.bing.net/th?id=OIP.KAmHnDs9MeIOdCD-hRzzcgHaHa&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.md_0xZr2RE4D4cL9Dp9CuAHaJ4&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.hemg4lvt8HzmyhkxFarNhAHaJk&pid=Api&P=0&h=220",
    "https://tse3.mm.bing.net/th?id=OIP.oIVBB6ei2Mro08IxTxquHgHaHa&pid=Api&P=0&h=220",
    "https://tse4.mm.bing.net/th?id=OIP.lU-LBbxcd3sCU8QgkYwgWQHaHa&pid=Api&P=0&h=220",
    "https://tse2.mm.bing.net/th?id=OIP.yc9-PYeu81jMoXaRcK_YgQHaHa&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.j5YL-jxSpki3-PuXH8Kl7QHaHa&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.rl0JWrAqv7ekPknYA4TZtAHaHa&pid=Api&P=0&h=220",
    "https://tse2.mm.bing.net/th?id=OIP.8x5X4plIzQTYcRBsUZL7PAHaHa&pid=Api&P=0&h=220",
    "https://tse4.mm.bing.net/th?id=OIP.ISuI-T5arZVr2mtPFc9j2gHaHa&pid=Api&P=0&h=220",
    "https://tse4.mm.bing.net/th?id=OIP.jGhMnfhdE9Q4UwiEPUXI5wHaGl&pid=Api&P=0&h=220",
    "https://images-na.ssl-images-amazon.com/images/I/81gt6U6lKvL._SL1500_.jpg",

  ];
  List<String> cards =[
    'DISCOUNT',
    'NEW ARRIVE',
    'BEST SELLER',
    'OLD COLLECTION',
  ];
  List<String> cards_images =[
    "https://tse4.mm.bing.net/th?id=OIP.IhA0Q6yJFJ_HRB_8Te-SHQHaLL&pid=Api&P=0&h=220",
    "https://dress-trends.com/wp-content/uploads/2016/11/%D0%9Aids-fashion-trends-and-tendencies-2017-kids-clothes-kids-wear-4.jpg",
    "https://tse4.mm.bing.net/th?id=OIP.TVYCyEjxpsOJTT4IhPFC4AHaHa&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.O53SFDVVFa8JoPwhWbJGPwHaHa&pid=Api&P=0&h=220",

  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*.15,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return show_item(context,images[index],names[index],id_user);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 5,);
                  },
                  itemCount: names.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,

                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return show_card(context,cards[index],cards_images[index],id_user);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 5,);
                  },
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,

                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
  Widget show_item(context,String image ,String name,String id_user)=>Padding(
    padding: const EdgeInsets.only(top: 12,left: 12,right: 12),
    child: Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, display.routname,
                arguments:displayss("kids", name,id_user) );
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage("${image}"),
            radius: 35,
          ),
        ),
        SizedBox(height: 5,),
        Text("${name}",style: TextStyle(fontSize: 17,color: Colors.black),)
      ],
    ),
  );

  Widget show_card(context,String name ,String image,String id_user)=>Padding(
    padding: const EdgeInsets.all(6.0),
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children : [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, display_card.routname,
                    arguments:displays_card("kids", name,id_user) );
              },
              child: Image(
                image: NetworkImage("${image}"),
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height*.6,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text("${name}",style: TextStyle(color: Kmaincolor,fontSize: 35,fontWeight: FontWeight.bold,fontFamily: 'Pacifico'),),
            )
          ]
      ),
      margin: EdgeInsets.all(12),
      elevation: 10,
    ),
  );
}
