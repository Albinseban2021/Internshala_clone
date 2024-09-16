import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:internshala_clone/internship_page.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Adding post frame callback to execute the navigation after the build method
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      loadDataAndNavigate();
    });
  }

  Future<void> loadDataAndNavigate() async {
    // Simulate some loading process
    await Future.delayed(Duration(seconds: 3));

    // Navigate to Home Screen
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => InternshipPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.jpg', height: 120.0),
            const SizedBox(height: 24),
            Text('Internshala',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text(
                'Trusted by over 21 Million College students & Graduates',
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}