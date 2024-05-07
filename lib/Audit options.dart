import 'package:flutter/material.dart';
import 'package:project/Viewpage.dart';
import 'package:project/addandupdate.dart';
import 'package:project/login.dart';
import 'package:project/updatedetails.dart';

class AuditorHomeScreen extends StatelessWidget {
  const AuditorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditor Homepage',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
              icon: Icon(Icons.logout, color: Colors.black),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AuditCards(
                width: width,
                height: height,
                imagePath: 'assets/addnew.png',
                label: 'Add details',
                callback: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>addandupdate()));
                  // Implement your navigation logic here
                },
              ),
              AuditCards(
                width: width,
                height: height,
                imagePath: 'assets/update.png',
                label: 'Update details',
                callback: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>updatepage()));
                  // Implement your navigation logic here
                },
              ),
            ],
          ),
          SizedBox(height: height * 0.07),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AuditCards(
                width: width,
                height: height,
                imagePath: 'assets/file.png',
                label: 'View files',
                callback: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPage()));
                  // Implement your navigation logic here
                },
              ),
            ],
          ),

        ],
      ),
    );
  }
}

class AuditCards extends StatelessWidget {
  const AuditCards({
    Key? key,
    required this.height,
    required this.width,
    required this.imagePath,
    required this.label,
    this.callback,
  }) : super(key: key);

  final double height;
  final double width;

  final String imagePath;
  final String label;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      elevation: 10,
      child: GestureDetector(
        onTap: callback,
        child: SizedBox(
          height: height * 0.16,
          width: width * 0.32,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePath,
                  height: height * 0.1,
                ),
              ),
              Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
