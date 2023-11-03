import 'package:e_commerec/const.dart';
import 'package:e_commerec/screens/user_screen/display.dart';
import 'package:e_commerec/screens/user_screen/display_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../firebase_data/model.dart';

class baby extends StatelessWidget {
  String id_user;
  baby(this.id_user);
  List<String> names =[
    "Sweashirt",
    "Homewear",
    "Leggings",
    "Overalls",
    "Bodysuit",
    "T-shirt",
    "Dress",
    "Trousers",
    "Set",
    "Newborn",
    "Socks",
  ];
  List<String> images =[
    "https://tse3.mm.bing.net/th?id=OIP.SKun57yUvl6DBM_NF9IAoQHaGn&pid=Api&P=0&h=220",
    "https://images-na.ssl-images-amazon.com/images/I/919LNdWXk%2BL._AC_UL1500_.jpg",
    "https://tse1.explicit.bing.net/th?id=OIP.aL-A4_LKWEwzxdnK9J_ZVgHaHa&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.9BltkNRoYlcvrt-tb00dgwHaJQ&pid=Api&P=0&h=220",
    "https://tse3.explicit.bing.net/th?id=OIP.GBk8NkPat2j9yYddxc8IsgHaJ4&pid=Api&P=0&h=220",
    "https://cdn.notonthehighstreet.com/system/product_images/images/001/178/110/original_funny-baby-t-shirt.jpg",
    "https://tse2.mm.bing.net/th?id=OIP.yI228-O25vggQRxWI4C3hgHaHa&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.QCRK6_MuWVU-nL6sPgZwuAHaHa&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.SwyeklcyTtly3JxDyKIlcAHaHa&pid=Api&P=0&h=220",
    "https://tse3.mm.bing.net/th?id=OIP._v7WVFvyU5stxMQgEARXjQHaLH&pid=Api&P=0&h=220",
    "https://tse3.mm.bing.net/th?id=OIP.1dl_Ap3dmQfaJ0FbMXO3swHaHa&pid=Api&P=0&h=220",

  ];
  List<String> cards =[
    'DISCOUNT',
    'NEW ARRIVE',
    'BEST SELLER',
    'OLD COLLECTION',
  ];
  List<String> cards_images =[
    "https://tse2.mm.bing.net/th?id=OIP.Ju4Jxmi1ReI-PIicFSODuAHaLH&pid=Api&P=0&h=220",
    "https://tse4.mm.bing.net/th?id=OIP.tzDJt3YjL2VQu1_ncc3R7wHaHa&pid=Api&P=0&h=220",
    "https://tse4.mm.bing.net/th?id=OIP.oGjAom0yjwpazVOdIuqwaAHaHa&pid=Api&P=0&h=220",
    "https://tse2.mm.bing.net/th?id=OIP._k1axXUzW7oFdDHy0_mcDwHaLU&pid=Api&P=0&h=220",

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
                    arguments:displays_card("baby", name,id_user) );
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
