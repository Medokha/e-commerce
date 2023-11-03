import 'package:e_commerec/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class user_formation extends StatelessWidget {
  static const String routname ='user_formation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
          Card(
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image(image: NetworkImage("https://img.freepik.com/free-photo/cheerful-young-woman-communicating-with-smartphone_23-2147727688.jpg?w=996&t=st=1698845509~exp=1698846109~hmac=6bb8320c5fd69f07a61b0dad15db280aba6aba2b17f4b03dfeeea531e6005723"
                  ),fit: BoxFit.fill,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white.withOpacity(.5),
                      width: double.infinity,
                      height: 70,

                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("shose",style: TextStyle(fontSize: 20,color: Colors.black),),
                              Text("50 \$",style: TextStyle(fontSize: 20,color: Colors.black),),
                            ],
                          )


                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight:Radius.circular(18) )
                          ),
                          child: ElevatedButton(onPressed: (){}, child: Text("Add Car",style: TextStyle(color: Colors.black,fontSize: 18),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Kmaincolor)),))),
                  Align(
                    alignment: Alignment.topRight,
                      child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart,color: Colors.red,size: 30,)))


                ],
              ),
            ),
          ),
          Card(
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image(image: NetworkImage("https://img.freepik.com/free-photo/cheerful-young-woman-communicating-with-smartphone_23-2147727688.jpg?w=996&t=st=1698845509~exp=1698846109~hmac=6bb8320c5fd69f07a61b0dad15db280aba6aba2b17f4b03dfeeea531e6005723"
                  ),fit: BoxFit.fill,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white.withOpacity(.5),
                      width: double.infinity,
                      height: 70,

                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("shose",style: TextStyle(fontSize: 20,color: Colors.black),),
                              Text("50 \$",style: TextStyle(fontSize: 20,color: Colors.black),),
                            ],
                          )


                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight:Radius.circular(18) )
                          ),
                          child: ElevatedButton(onPressed: (){}, child: Text("Add Car",style: TextStyle(color: Colors.black,fontSize: 18),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Kmaincolor)),))),
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart,color: Colors.red,size: 30,)))


                ],
              ),
            ),
          ),
          Card(
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image(image: NetworkImage("https://img.freepik.com/free-photo/cheerful-young-woman-communicating-with-smartphone_23-2147727688.jpg?w=996&t=st=1698845509~exp=1698846109~hmac=6bb8320c5fd69f07a61b0dad15db280aba6aba2b17f4b03dfeeea531e6005723"
                  ),fit: BoxFit.fill,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white.withOpacity(.5),
                      width: double.infinity,
                      height: 70,

                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("shose",style: TextStyle(fontSize: 20,color: Colors.black),),
                              Text("50 \$",style: TextStyle(fontSize: 20,color: Colors.black),),
                            ],
                          )


                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight:Radius.circular(18) )
                          ),
                          child: ElevatedButton(onPressed: (){}, child: Text("Add Car",style: TextStyle(color: Colors.black,fontSize: 18),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Kmaincolor)),))),
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart,color: Colors.red,size: 30,)))


                ],
              ),
            ),
          ),
          Card(
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image(image: NetworkImage("https://img.freepik.com/free-photo/cheerful-young-woman-communicating-with-smartphone_23-2147727688.jpg?w=996&t=st=1698845509~exp=1698846109~hmac=6bb8320c5fd69f07a61b0dad15db280aba6aba2b17f4b03dfeeea531e6005723"
                  ),fit: BoxFit.fill,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white.withOpacity(.5),
                      width: double.infinity,
                      height: 70,

                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("shose",style: TextStyle(fontSize: 20,color: Colors.black),),
                              Text("50 \$",style: TextStyle(fontSize: 20,color: Colors.black),),
                            ],
                          )


                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight:Radius.circular(18) )
                          ),
                          child: ElevatedButton(onPressed: (){}, child: Text("Add Car",style: TextStyle(color: Colors.black,fontSize: 18),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Kmaincolor)),))),
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart,color: Colors.red,size: 30,)))


                ],
              ),
            ),
          ),
          Card(
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image(image: NetworkImage("https://img.freepik.com/free-photo/cheerful-young-woman-communicating-with-smartphone_23-2147727688.jpg?w=996&t=st=1698845509~exp=1698846109~hmac=6bb8320c5fd69f07a61b0dad15db280aba6aba2b17f4b03dfeeea531e6005723"
                  ),fit: BoxFit.fill,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white.withOpacity(.5),
                      width: double.infinity,
                      height: 70,

                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("shose",style: TextStyle(fontSize: 20,color: Colors.black),),
                              Text("50 \$",style: TextStyle(fontSize: 20,color: Colors.black),),
                            ],
                          )


                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight:Radius.circular(18) )
                          ),
                          child: ElevatedButton(onPressed: (){}, child: Text("Add Car",style: TextStyle(color: Colors.black,fontSize: 18),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Kmaincolor)),))),
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart,color: Colors.red,size: 30,)))


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
