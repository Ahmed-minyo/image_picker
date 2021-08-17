import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImage with ChangeNotifier{
  File selectedImage;

Future <void> selectImage() async {
  final picker = ImagePicker();
  var image = await picker.pickImage(source: ImageSource.gallery);

  selectedImage = File(image.path) ;
  notifyListeners();
}


}