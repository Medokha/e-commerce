
import 'package:e_commerec/providers/log_provider.dart';
import 'package:e_commerec/screens/home_user.dart';
import 'package:e_commerec/screens/homepage_admin.dart';
import 'package:e_commerec/screens/singin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../const.dart';
import '../firebase_atho/firebase_authu.dart';

class login extends StatelessWidget {
  static const String routname= 'login';
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _email =TextEditingController();
  TextEditingController _password =TextEditingController();
  String password_admin ='admin123';
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
                    obscureText: pro.show,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      suffixIcon: pro.show ?InkWell(
                        onTap: (){
                          pro.show_password();
                        },
                          child: Icon(Icons.visibility_off)):InkWell(
                          onTap: (){
                            pro.show_password();
                          },
                          child: Icon(Icons.visibility)),
                      suffixIconColor: Kmaincolor,
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
                        String email = _email.text;
                        String password = _password.text;

                        User? user = await _auth.signInWithEmailAndPassword(email, password);

                        if (user!= null){
                          print("User is successfully signedIn");
                          if(password==password_admin && pro.clicked){
                            pro.hide_progres();
                            Navigator.pushReplacementNamed(context, home_admain.routname);
                          }else{
                            pro.hide_progres();
                            print("cant login as admin");
                          }
                          if(!pro.clicked){
                            pro.hide_progres();
                            Navigator.pushReplacementNamed(context, home_user.routname);}
                        } else{
                          pro.hide_progres();
                          print("Some error happend");
                        }
                      }
                    },
                    child: Text("Login",style: TextStyle(fontSize: 20),),style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(Colors.black),
                  ),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Dont have an account ? ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                      TextButton(onPressed: (){
                        Navigator.pushReplacementNamed(context, singin.routname);
                      }, child: Text("Singin",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)))
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){
                          pro.change_clicked();
                        },
                        child: Text("Login as Admin ",style: TextStyle(
                            color:pro.clicked? Kmaincolor :Colors.black ,
                            fontSize: 15,fontWeight: FontWeight.bold),),
                      ),
                      InkWell(
                        onTap: (){
                          pro.change_clicked();
                        },
                        child: Text("Login as User",style: TextStyle(
                            color: pro.clicked?  Colors.black :Kmaincolor,
                            fontSize: 15,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
