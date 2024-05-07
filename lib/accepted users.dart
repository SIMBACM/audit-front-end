import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'package:project/models/signupmodel.dart';
import 'package:project/services/services.dart';

class Aand extends StatefulWidget {
  @override
  _AandState createState() => _AandState();
}

class _AandState extends State<Aand> {
  late Future<List<Posts>> data;

  @override
  void initState() {
    super.initState();
    data = PostApiServices().Acceptedusers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accepted users',
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
      body: FutureBuilder<List<Posts>>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final userDetailsList = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Number of Data: ${userDetailsList.length}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: userDetailsList.length,
                    itemBuilder: (context, index) {
                      final userDetails = userDetailsList[index];
                      return Card(
                        color: Colors.blue,
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.blue,
                                        child: Text(
                                          userDetails.username.substring(0, 1),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text('Name: ${userDetails.username}',),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text('Email: ${userDetails.email}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                ),
              ],
            );
          } else {
            return Center(child: Text('No user details available'));
          }
        },
      ),
    );
  }
}
