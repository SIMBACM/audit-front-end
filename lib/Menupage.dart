import 'package:flutter/material.dart';
import 'package:project/Accept%20and%20reject.dart';
import 'package:project/View%20in%20admin.dart';
import 'package:project/accepted%20users.dart';
import 'package:project/login.dart';


class Adminhomepage extends StatefulWidget {
  const Adminhomepage({Key? key}) : super(key: key);

  @override
  State<Adminhomepage> createState() => _Adminhomepage();
}

class _Adminhomepage extends State<Adminhomepage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Admin panel",
        style: TextStyle(
          color: Colors.white
        ),),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            icon: Icon(Icons.logout, color: Colors.black),
          ),
        ],
        shape: const Border(
          bottom: BorderSide(
            color: Colors.black26,
            width: 1.0, // Border width
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 150), // Add space here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeCard(
                        width: width,
                        height: height,
                        onPress: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AandR()));
                        },
                        imagePath: 'assets/management.png', // Update with image asset path
                        title: 'Access Control',
                      ),
                      SizedBox(height: 10),
                      HomeCard(
                        width: width,
                        height: height,
                        onPress: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => adminViewPage()));
                        },
                        imagePath: 'assets/file.png', // Update with image asset path
                        title: 'View files',
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeCard(
                        width: width,
                        height: height,
                        onPress: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Aand()));
                        },
                        imagePath: 'assets/verified-user.png', // Update with image asset path
                        title: 'Accepted users',
                      ),

                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.height,
    required this.width,
    required this.onPress,
    required this.imagePath,
    required this.title,
  }) : super(key: key);
  final double height;
  final double width;


  final VoidCallback onPress;
  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Material(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        elevation: 10,
        child: SizedBox(
          child: Container(
            margin: EdgeInsets.all(10),
            height: height * 0.16,
            width: width * 0.32,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  height: height * 0.1, // Adjust image size
                ),
                SizedBox(height: 8.0),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
