import 'package:flutter/cupertino.dart';

class provider_log extends ChangeNotifier{
  bool clicked =false;
  void change_clicked(){
    clicked =!clicked;
    notifyListeners();
  }
  bool show =true;
  void show_password(){
    show =!show;
    notifyListeners();
  }
  bool saving = false;
  void hide_progres(){
    saving=!saving;
    notifyListeners();
  }



}