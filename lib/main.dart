import 'package:flutter/material.dart';
import 'package:internshala_clone/internship_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Internship App',
      home: InternshipPage(),
    );
  }
}