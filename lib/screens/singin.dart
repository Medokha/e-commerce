
import 'package:e_commerec/firebase_data/model.dart';
import 'package:e_commerec/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../const.dart';
import '../firebase_atho/firebase_authu.dart';
import '../firebase_data/firebase_user.dart';
import '../providers/log_provider.dart';

class singin extends StatelessWidget {
  static const String routname ='singin';
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _email =TextEditingController();
  TextEditingController _password =TextEditingController();
  TextEditingController _name =TextEditingController();

  final _key =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<provider_log>(context);
    return ModalProgressHUD(
      inAsyncCall: pro.saving,
      child: Scaffold(
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
                    onPressed: () async {
                      if(_key.currentState!.validate()){
                        pro.hide_progres();
                        String username = _name.text;
                        String email = _email.text;
                        String password = _password.text;
                        users new_user =users(name: _name.text, mail: _email.text);
                        User? user = await _auth.signUpWithEmailAndPassword(email, password);
                        adduserFirebaseFirestore(new_user);
                        if (user!= null){
                          print("User is successfully created");
                          pro.hide_progres();
                          Navigator.pushNamed(context, login.routname);
                        } else{
                          pro.hide_progres();
                          print("Some error happend");
                        }

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
      ),
    );
  }

}
