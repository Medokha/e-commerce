import 'package:e_commerec/const.dart';
import 'package:e_commerec/screens/user_screen/display.dart';
import 'package:e_commerec/screens/user_screen/display_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerec/firebase_data/model.dart';


class woman extends StatelessWidget {
  String id_user;
  woman(this.id_user);
  List<String> names =[
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
  ];
  List<String> images =[
    "https://tse1.mm.bing.net/th?id=OIP.1-OvzPfA-G9XmQQGHV7XngHaJ4&pid=Api&P=0&w=300&h=300",
    "https://images.bubbleroom.se/data/product/1300x1887/levis-501-ct-jeans-denim-cali-cool_2.jpg",
    "https://tse1.mm.bing.net/th?id=OIP.Z0grlGxvdSCX6Cxze59RlAHaJ4&pid=Api&P=0&h=220",
    "https://tse4.explicit.bing.net/th?id=OIP.ceJRVfPXrEExiXLUkbaoxAHaKq&pid=Api&P=0&h=220",
    "https://tse2.mm.bing.net/th?id=OIP.BKCGdA-2tZDMMGqQERboSwHaLH&pid=Api&P=0&h=220",
    "https://tse2.mm.bing.net/th?id=OIP.kv3ztreG48tP_NqQUr5BKAHaIr&pid=Api&P=0&h=220",
    "https://tse2.mm.bing.net/th?id=OIP.EvzIDzViOEaw-wz8ypBVoAHaJ4&pid=Api&P=0&h=220",
    "https://tse4.mm.bing.net/th?id=OIP.xZmu73SHUFECMEDuUGk_uQHaHa&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.-Cxfxksm60WZY3RPVOiGhgHaHa&pid=Api&P=0&h=220",
    "https://tse4.mm.bing.net/th?id=OIP.ZgFn6LBJsaMyvF0QUsmg9wHaKs&pid=Api&P=0&h=220",
    "https://tse3.mm.bing.net/th?id=OIP.HaH7d1nBe8h3edK3V-KzNgHaLH&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.0vsNzjFzzIwL9yJF4xkWUAHaLH&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.SxPZU8gcbs6N7XuM_T5KEAHaIi&pid=Api&P=0&h=220",
    "https://tse3.mm.bing.net/th?id=OIP.Cdi1cjw6p7ITIo0EDvUZuQHaNJ&pid=Api&P=0&h=220",
    "https://ladyviolette.com/wp-content/uploads/2011/08/IMG_0654.jpg",
    "https://tse1.mm.bing.net/th?id=OIP.lXULWv3zhaUIlIvlrxaFOQHaHa&pid=Api&P=0&h=220",
  ];
  List<String> cards =[
    'DISCOUNT',
    'NEW ARRIVE',
    'BEST SELLER',
    'OLD COLLECTION',
  ];
  List<String> cards_images =[
    'https://i.pinimg.com/originals/85/c5/3f/85c53f228efc1836ae24523a267ed594.jpg',
    'https://tse2.explicit.bing.net/th?id=OIP.T4sImVKYvp6q6GVGi7DYEgHaJ3&pid=Api&P=0&h=220',
    'https://i.pinimg.com/originals/84/1f/88/841f88e3fbe10a9a7e30851037c85065.jpg',
    'https://i.pinimg.com/474x/01/9d/34/019d34ccd0e740822bede1099c5431a3.jpg',
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
                  itemCount: 16,
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
  Widget show_item(context,String image ,String name,String user_id)=>Padding(
    padding: const EdgeInsets.only(top: 12,left: 12,right: 12),
    child: Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, display.routname,
                arguments:displayss("woman", name,user_id) );
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

  Widget show_card(context,String name ,String image,String user_id)=>Padding(
    padding: const EdgeInsets.all(6.0),
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children : [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, display_card.routname,
                    arguments:displays_card("woman", name,user_id) );
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
