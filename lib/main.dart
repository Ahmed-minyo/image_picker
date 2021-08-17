import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/pick_image.dart';
import 'package:task/provider/select_image.dart';
import 'package:task/screens/auth/auth_screen.dart';
import 'package:task/screens/gallery.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
           create: (context) => SelectImage(),
        ),
        ChangeNotifierProvider(
          create: (context) => CaptureImage(),
        ),
      ],
      child: MaterialApp(
        title: 'Task',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
          routes: {
            AuthScreen.routeName: (ctx) => AuthScreen(),
            Gallery.routeName: (ctx) => Gallery(),

          }
      ),
    );
  }
}

