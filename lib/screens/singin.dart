import 'package:e_commerc/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class singin extends StatelessWidget {
  static const String routname ='singin';
  TextEditingController _email =TextEditingController();
  TextEditingController _password =TextEditingController();
  TextEditingController _name =TextEditingController();

  final _key =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kmaincolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key:_key ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeArea(child: Container()),
                Image(image: AssetImage("assets/images/icons/buy.png"),),
                SizedBox(height: 30,),
                TextFormField(
                  controller: _name,
                  cursorColor: Kmaincolor,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'User Name',
                    prefixIcon: Icon(Icons.person),
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
                      return "error name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _email,
                  cursorColor: Kmaincolor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.email),
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
                    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value!);
                    if(!emailValid){
                      return 'email not valid';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _password,
                  cursorColor: Kmaincolor,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.password),
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
                      return "error password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){
                    if(_key.currentState!.validate()){

                    }
                  },
                  child: Text("Singup",style: TextStyle(fontSize: 20),),style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Colors.black),
                ),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Don have an account ? ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, login.routname);
                    }, child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)))
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
