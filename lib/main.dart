import 'package:flutter/material.dart';
import 'package:internshala_clone/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Internship App',
      home: SplashScreen(),
    );
  }
}