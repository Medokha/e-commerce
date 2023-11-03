import 'package:e_commerec/const.dart';
import 'package:e_commerec/screens/user_screen/display.dart';
import 'package:e_commerec/screens/user_screen/display_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../firebase_data/model.dart';

class man extends StatelessWidget {
  String id_user;
  man(this.id_user);
  List<String> names =[
    "Outerwear",
    "Jeans",
    "Sweashirt",
    "Underwear",
    "Homewear",
    "DF fit",
    "Pullover",
    "Perfume",
    "T-shirt",
    "Biazer",
    "Jogger",
    "Shirt",
    "Cardigan",
    "Licensed",
    "Shoes",
    "Bags",
  ];
  List<String> images =[
    "https://tse1.mm.bing.net/th?id=OIP.19aYOp-Q0mZDFYL4e0zsWgHaIi&pid=Api&P=0&h=220",
    "https://tse2.mm.bing.net/th?id=OIP.W_zVfeQ0nEKdUUrzrziGrwHaKl&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.GybCT3bc4eIKhidbBVjlmwHaJ4&pid=Api&P=0&h=220",
    "https://www.menandunderwear.com/wp-content/uploads/2020/03/Adam-Smith-Wear-underwear-0-Exclusive-Collection-06.jpg",
    "https://tse1.mm.bing.net/th?id=OIP.LO2QQCuaARvi28HBZA-xAgHaHa&pid=Api&P=0&h=220",
    "https://thumbs.dreamstime.com/b/super-fit-young-man-portrait-working-out-41181588.jpg",
    "https://tse1.explicit.bing.net/th?id=OIP.fj63AyZcOpKIC1LQOeOL9QHaJR&pid=Api&P=0&h=220",
    "https://tse3.mm.bing.net/th?id=OIP.nizKmO33S95sUPPhsEx-_AHaJc&pid=Api&P=0&h=220",
    "https://tse4.mm.bing.net/th?id=OIP.-Kl64xL5UZuepRRy6erIHQHaKs&pid=Api&P=0&h=220",
    "https://tse3.mm.bing.net/th?id=OIP.diIPJndV1NKydJSZRV4WGAHaK-&pid=Api&P=0&h=220",
    "https://tse2.mm.bing.net/th?id=OIP.4Lo068IiS_XDPOy0ZhPJUAHaIp&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.ehaK4hx6rkIqzwHEk1FyfgHaJo&pid=Api&P=0&h=220",
    "https://tse4.mm.bing.net/th?id=OIP.RlxpBD5LzwgCaOcAFyTdpgHaIi&pid=Api&P=0&h=220",
    "https://media.istockphoto.com/photos/young-man-showing-off-his-driver-license-picture-id470922047?k=6&m=470922047&s=612x612&w=0&h=R2OqP4SSzZJzafRO6xTg4MLybwdGLQedz5TvNrWemW8=",
    "https://tse2.mm.bing.net/th?id=OIP.5dOkL3VOqeBrZim5msIaowHaHH&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.hOuQNLNAcdWEXUVoHBQmlAHaFw&pid=Api&P=0&h=220",

  ];
  List<String> cards =[
    'DISCOUNT',
    'NEW ARRIVE',
    'BEST SELLER',
    'OLD COLLECTION',
  ];
  List<String> cards_images =[
    "https://i.pinimg.com/736x/79/0c/93/790c93c63a97da4155ec721dae6264a8.jpg",
    "https://tse1.mm.bing.net/th?id=OIP.ab826nY3WiNBoRsNm5QrRwHaKy&pid=Api&P=0&h=220",
    "https://cdn.shopify.com/s/files/1/0162/2116/files/mens_fall_street_style_looks_5.jpg?v=1507694764",
    "https://tse3.mm.bing.net/th?id=OIP.0DxDe6U8dqmulNyvyLDrFgHaO0&pid=Api&P=0&h=220",

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
  Widget show_item(context,String image ,String name,String id_user)=>Padding(
    padding: const EdgeInsets.only(top: 12,left: 12,right: 12),
    child: Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, display.routname,
                arguments:displayss("man", name,id_user) );
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
                    arguments:displays_card("man", name,id_user) );
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
