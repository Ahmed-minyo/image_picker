import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/helper/sizes.dart';
import 'package:task/provider/pick_image.dart';
import 'package:task/screens/gallery.dart';


Widget contain(BuildContext context, String txt) {
  return ElevatedButton(
    child: Text(
      txt,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal),
    ),
    onPressed: () {
      Navigator.of(context).pushNamed(Gallery.routeName);
    },
  );
}

class Camera extends StatefulWidget {
  final String data;
  Camera(this.data);

  @override
  _CameraState createState() => _CameraState(this.data);
}

class _CameraState extends State<Camera> {
  String data;
  _CameraState(this.data);




  @override
  void initState() {
     Provider.of<CaptureImage>(context,listen: false).fetchLocalImage();
    super.initState();
  }


  void _takePicture() async {
    await Provider.of<CaptureImage>(context,listen: false).takePicture();



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi ${data.toUpperCase()}'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
                 body: ListView( padding: EdgeInsets.symmetric(horizontal: 30),
                    children: [
                      SizedBox(
                        height: height(context) * 0.1,
                      ),
                      IconButton(
                        icon: Icon(Icons.camera_alt_rounded),
                        onPressed: _takePicture,
                        iconSize: 55,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      Container(
                        height: height(context) * 0.25,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Provider.of<CaptureImage>(context).newImage != null
                            ? Image.file(
                          Provider.of<CaptureImage>(context).newImage,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              )
                            : Text(
                                'No Image Taken',
                                textAlign: TextAlign.center,
                              ),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      contain(context, 'Go to Gallery'),
                    ],
                 )
    );
  }
}
