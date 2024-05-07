import 'package:flutter/material.dart';

import 'package:project/login.dart';
import 'package:project/services/services.dart';
import 'package:project/updatewithfields.dart';



// Import AuditService here

class updatepage extends StatefulWidget {
  const updatepage({Key? key}) : super(key: key);

  @override
  State<updatepage> createState() => _updatepageState();
}

class _updatepageState extends State<updatepage> {
  TextEditingController auditno = TextEditingController();
  TextEditingController taxpayername = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController taxpayeraddress = TextEditingController();
  TextEditingController rangeanddivision = TextEditingController();
  TextEditingController regno = TextEditingController();
  TextEditingController startdate = TextEditingController();
  TextEditingController enddate = TextEditingController();
  TextEditingController dateofau = TextEditingController();
  TextEditingController iapno = TextEditingController();
  TextEditingController nameofsupdt = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController total = TextEditingController();
  TextEditingController objection = TextEditingController();
  TextEditingController spot = TextEditingController();
  TextEditingController amountother = TextEditingController();
  TextEditingController divno = TextEditingController();
  TextEditingController SCNno = TextEditingController();
  TextEditingController SCNdate = TextEditingController();
  TextEditingController reasonforclosure = TextEditingController();
  TextEditingController dateofclo = TextEditingController();
  TextEditingController remarks = TextEditingController();
  TextEditingController amtscn = TextEditingController();
  List<String> closurepara = [];
  List<String> objections = [];
  List<String> amounts = [];

  void _fetchaudit() async {
    try {
      final response = await PostApiServices().updateinfo(auditno.text
      );


      if (response["status"] ==
          "success") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Addandupdate(
              auditData: response['data'],
            ),
          ),
        );
        print("added");
      } else {
        print("error");
      }
    } catch (e) {
      print("Exception occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Auditor update details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: Icon(Icons.logout, color: Colors.black),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: auditno,
                decoration: InputDecoration(
                  labelText: 'Audit Report No',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Add some space between TextField and Button
              ElevatedButton(
                onPressed: () {
                  _fetchaudit(); // Call method to fetch audit details
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

