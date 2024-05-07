import 'package:flutter/material.dart';
import 'package:project/adminBottomNavigator.dart';
import 'package:project/login.dart';
import 'package:project/models/infomodel.dart';
import 'package:project/services/services.dart';

class adminViewPage extends StatefulWidget {
  const adminViewPage({Key? key}) : super(key: key);

  @override
  State<adminViewPage> createState() => _adminViewPageState();
}

class _adminViewPageState extends State<adminViewPage> {
  late Future<List<Audit>> auditdata;

  @override
  void initState() {
    super.initState();
    auditdata = PostApiServices().infosave();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin view page',
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
      body: FutureBuilder<List<Audit>>(
        future: auditdata,
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
                                      userDetails.nameOfTheTaxpayer.substring(0, 1).toUpperCase(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Text(
                                    'Name: ${userDetails.nameOfTheTaxpayer}',
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Navigate to a new page to show full details
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => adminDetailsScreen(userDetails: userDetails),
                                        ),
                                      );
                                    },
                                    child: Text('View Details'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text('Address: ${userDetails.addressOfTheTaxpayer}'),
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
