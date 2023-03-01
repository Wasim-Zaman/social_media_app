import 'package:flutter/material.dart';
import 'package:social_media/res/theme.dart';
import 'package:social_media/view/home/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Social Media App',
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      home: Home(),
    );
  }
}
