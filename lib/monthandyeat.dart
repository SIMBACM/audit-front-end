import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class AuditDataScreen extends StatefulWidget {
  @override
  _AuditDataScreenState createState() => _AuditDataScreenState();
}

class _AuditDataScreenState extends State<AuditDataScreen> {
  String? selectedMonth = 'January';
  String? selectedYear = '2022';

  List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July',
    'August', 'September', 'October', 'November', 'December'
  ];

  List<String> years = [
    '2021', '2022', '2023', '2024' // Add more years if needed
  ];

  Future<void> _submit() async {
    final response = await http.post(
      Uri.parse('http://localhost:3001/audit/viewauditdata'),
      body: {'month': selectedMonth!, 'year': selectedYear!},
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final List<dynamic> data = json.decode(response.body)['data'];
      // Handle the data as needed
    } else {
      // If the server returns an error response, show an error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to load audit data'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audit Data Viewer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: selectedMonth,
              onChanged: (String? newValue) {
                setState(() {
                  selectedMonth = newValue;
                });
              },
              items: months.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedYear,
              onChanged: (String? newValue) {
                setState(() {
                  selectedYear = newValue;
                });
              },
              items: years.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}