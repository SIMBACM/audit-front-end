import 'package:flutter/material.dart';
import 'package:project/models/signupmodel.dart';
import 'package:project/services/services.dart';



class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: _selectedIndex == 1
          ? UserDetailsScreen()
          : SizedBox(), // Placeholder or empty widget when not viewing permissions
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'View Files',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Manage Permissions',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}


class UserDetailsScreen extends StatefulWidget {
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
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
        title: Text('User Details'),
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
                                  Text('Name: ${userDetails.username}', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
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



class ViewFilesScreen extends StatelessWidget {
  final VoidCallback viewFiles;

  ViewFilesScreen({required this.viewFiles});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewFiles,
      child: Center(
        child: Text(
          'View Files Screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
