import 'package:flutter/material.dart';
import 'package:project/Accept%20and%20reject.dart';
import 'package:project/Menupage.dart';

class Adminpanel extends StatefulWidget {
  const Adminpanel({super.key});

  @override
  State<Adminpanel> createState() => _AdminpanelState();
}

class _AdminpanelState extends State<Adminpanel> {
  List<Widget> widgetList = [
    Adminhomepage(),
    AandR(),
  ];
  int Myindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: widgetList,
        index: Myindex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            Myindex = index;
          });
        },
        currentIndex: Myindex,
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person),
            label: 'Edit permission',
          ),
        ],
      ),
    );
  }
}













