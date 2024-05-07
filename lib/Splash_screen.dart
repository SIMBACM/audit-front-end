import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'dart:async'; // Import dart:async for Timer

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Start the animation after a short delay
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    // Redirect to the main page after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // Replace MainPage with your main page
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900], // Dark blue background color
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Display your app's logo or name here
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/logo_M.png', // Path to your 'M' logo image
                    height: 150, // Adjust size as needed
                    width: 150,
                    color: Colors.white.withOpacity(0.9), // Increased opacity for brightness
                  ),
                ],
              ),
              // You can add additional widgets like a loading spinner here if needed
            ],
          ),
        ),
      ),
    );
  }
}
