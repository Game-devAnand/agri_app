import 'package:flutter/material.dart';
import 'package:iedc_submit_agri/homePage.dart';
import 'package:iedc_submit_agri/main.dart';
import 'package:get/get.dart';

void main() {
  //
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}
