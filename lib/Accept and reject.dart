import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'package:project/models/signupmodel.dart';
import 'package:project/services/services.dart';

class AandR extends StatefulWidget {
  @override
  _AandRState createState() => _AandRState();
}

class _AandRState extends State<AandR> {
  late Future<List<Posts>> data;

  @override
  void initState() {
    super.initState();
    data = PostApiServices().fetchAllUserDetails();
  }
  void acceptUser(String id) async {
    try {
      await PostApiServices().acceptuser(id);
      setState(() {
        // Reload data after accepting the user
        data = PostApiServices().fetchAllUserDetails();
      });
      print("User accepted: $id");
    } catch (error) {
      print("Error accepting user: $error");
    }
  }

  void rejectUser(String id) async{
    try{
      await PostApiServices().reject(id);
      setState(() {
        data =PostApiServices().fetchAllUserDetails();
      });
      print("User rejected:$id");
    }catch(error){
      print("error accepting user: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Access control',
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
                                  CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    child: Text(
                                      userDetails.username.substring(0, 1).toUpperCase(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Text('Name: ${userDetails.username}',),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          acceptUser(userDetails.id);
                                          // Handle accept action
                                        },
                                        child: Text('Accept'),
                                      ),
                                      SizedBox(width: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          rejectUser(userDetails.id);
                                          // Handle reject action
                                        },
                                        child: Text('Reject'),
                                      ),
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
