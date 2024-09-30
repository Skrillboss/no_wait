import 'dart:io';
import 'package:image_picker/image_picker.dart';

class TakePhoto{
  final ImagePicker imagePicker = ImagePicker();

  Future<File> call(ImageSource imageSource) async{
    File imageFile = File('assets/svg/user-icon-fill.svg');
    XFile? imageXFile = await imagePicker.pickImage(source: imageSource);
    if (imageXFile != null) {
      imageFile = File(imageXFile.path);
    } else {
      print('No se seleccionó ninguna imagen');
    }
    return imageFile;
  }
}