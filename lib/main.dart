import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yazan_project2/ui/screen/home_screen.dart';
import 'package:yazan_project2/ui/screen/test_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
      ),
      home: TestScreen(),
    );
  }
}
