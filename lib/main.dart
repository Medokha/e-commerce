
import 'package:e_commerec/providers/log_provider.dart';
import 'package:e_commerec/screens/admin_screens/add.dart';
import 'package:e_commerec/screens/admin_screens/edit.dart';
import 'package:e_commerec/screens/admin_screens/edit_details.dart';
import 'package:e_commerec/screens/admin_screens/orders.dart';
import 'package:e_commerec/screens/admin_screens/view.dart';
import 'package:e_commerec/screens/home_user.dart';
import 'package:e_commerec/screens/homepage_admin.dart';
import 'package:e_commerec/screens/login_screen.dart';
import 'package:e_commerec/screens/singin.dart';
import 'package:e_commerec/screens/user_screen/car.dart';
import 'package:e_commerec/screens/user_screen/display.dart';
import 'package:e_commerec/screens/user_screen/display_cards.dart';
import 'package:e_commerec/screens/user_screen/love.dart';
import 'package:e_commerec/screens/user_screen/user_formation.dart';
import 'package:e_commerec/statemanagement/cachehelper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
late String mainpage;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await cache_helper.init();
  var id =await cache_helper.getid(key: "uId");
  if(id != null){
    mainpage = home_user.routname;
  }else{
    mainpage = login.routname;
  }
  runApp(
      MultiProvider(
    providers: [
     ChangeNotifierProvider(create: (_) => provider_log()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:mainpage ,
      routes: {
        login.routname :(context)=>login(),
        singin.routname :(context)=>singin(),
        home_admain.routname :(context)=>home_admain(),
        home_user.routname :(context)=>home_user(),
        add.routname :(context)=>add(),
        edit.routname :(context)=>edit(),
        view.routname :(context)=>view(),
        edit_details.routname :(context)=>edit_details(),
        user_formation.routname :(context)=>user_formation(),
        display.routname :(context)=>display(),
        display_card.routname :(context)=>display_card(),
        car.routname :(context)=>car(),
        love.routname :(context)=>love(),
        orderss.routname :(context)=>orderss(),




      },
    );
  }
}

