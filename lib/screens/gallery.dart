import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/helper/sizes.dart';
import 'package:task/provider/select_image.dart';

class Gallery extends StatefulWidget {
  static const routeName = '/gallery';

  @override
  _GalleryState createState() => new _GalleryState();
}
class _GalleryState extends State<Gallery> {
  Future getImage() async {
    await Provider.of<SelectImage>(context, listen: false).selectImage();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: Container(
        height: height(context) * 0.3,
        width: width(context) * 0.8,
        child: Provider.of<SelectImage>(context).selectedImage ==
                null
            ? Center(child: Text('No image selected.'))
            : Image.file(
                Provider.of<SelectImage>(context).selectedImage),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child:Icon(Icons.add_a_photo),
      ),
    );
  }
}
