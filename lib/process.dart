import 'package:flutter/material.dart';
class process extends StatefulWidget {
  const process({super.key});

  @override
  State<process> createState() => _processState();
}

class _processState extends State<process> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Hi Ajay',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
