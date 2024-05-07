// import 'package:flutter/material.dart';
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             const SizedBox(height: 40),
//             CircleAvatar(
//               radius: 70,
//               backgroundImage: AssetImage('assets/images/user.JPG'),
//             ),
//             const SizedBox(height: 20),
//             itemProfile('Name: ${userDetails.username, CupertinoIcons.person),
//             const SizedBox(height: 10),
//             itemProfile('Email: ${userDetails.email}', CupertinoIcons.mail),
//             const SizedBox(height: 20,),
//           ],
//         ),
//       ),
//     );
//   }
//
//   itemProfile(String title, String subtitle, IconData iconData) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//                 offset: Offset(0, 5),
//                 color: Colors.deepOrange.withOpacity(.2),
//                 spreadRadius: 2,
//                 blurRadius: 10
//             )
//           ]
//       ),
//       child: ListTile(
//         title: Text(title),
//         subtitle: Text(subtitle),
//         leading: Icon(iconData),
//         trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
//         tileColor: Colors.white,
//       ),
//     );
//   }
// }