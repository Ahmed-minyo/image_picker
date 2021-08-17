import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task/data/dataSource/local-data-manager.dart';
import 'package:task/data/dataSource/local_data_manager.impl.dart';
import 'package:task/data/repo/image_repo.dart';

class CaptureImage with ChangeNotifier{
  var imageAsByte;
  File newImage;

  Future <void> takePicture() async {
    final picker = ImagePicker();
    final imageFile =
    await picker.pickImage(source: ImageSource.camera, maxWidth: 500);
    if (imageFile == null) {
      return;
    }
    newImage = File(imageFile.path);
    writeCounter(newImage.readAsBytesSync());
    String stringFieldNormalTaskActions = jsonEncode(newImage.readAsBytesSync());
    await LocalDataManagerImpl().writeData(CachingKey.IMAGES, stringFieldNormalTaskActions);

    notifyListeners();
    return newImage;
  }

  void fetchLocalImage() async{
    String get=  await ImageRepo(LocalDataManagerImpl()).getImage();
    dynamic getPhoto = jsonDecode(get);
    List<int> photo = List<int>.from(getPhoto);
    newImage=  await writeCounter(photo);

    notifyListeners();
  }




Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}
Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counter.jpg');
}
Future<File> writeCounter(List<int> imageAsByte) async {
  final file = await _localFile;
  return file.writeAsBytes(imageAsByte);
}
Future<void> readCounter() async {
  final file = await _localFile;
  newImage = file;
}
}
