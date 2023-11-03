import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'get-states.dart';
import 'dart:io';


class getcubit extends Cubit<getstates> {
  getcubit() :super(getintialstate());

  static getcubit get(context) => BlocProvider.of(context);

  File file= File("") ;
  var imagepiker = ImagePicker();
  String imageurl ="";
  Future<void> uploodprofileimage() async {
    var imgpicker =await imagepiker.pickImage(source: ImageSource.camera);
    if(imgpicker != null){
      file =File(imgpicker.path);
      var nameimage =basename(imgpicker.path);
      // stare uplood
      var randam =Random().nextInt(10000000);
      nameimage ="$randam+$nameimage";
      final storageRef = FirebaseStorage.instance.ref('images/${Uri.file(nameimage).pathSegments.last}');
      await storageRef.putFile(file);
      var url = await storageRef.getDownloadURL();
      // end uplood
      imageurl =url;
      print(url);
      emit(getsuccesstate());
    }else{
      print("select image");
      emit(getfailstate("No select image"));
    }



  }
}