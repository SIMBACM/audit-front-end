// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:project/services/services.dart';
//
// enum YesNo { yes, no }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController total =TextEditingController();
//   TextEditingController startdate = TextEditingController();
//   TextEditingController auditno = TextEditingController();
//   TextEditingController taxpayername = TextEditingController();
//   TextEditingController taxpayeraddress = TextEditingController();
//   TextEditingController rangeanddiv = TextEditingController();
//   TextEditingController regno = TextEditingController();
//   TextEditingController isSCn = TextEditingController();
//   TextEditingController enddate = TextEditingController();
//   TextEditingController paraclosuredate = TextEditingController();
//   TextEditingController objection = TextEditingController();
//   TextEditingController amount = TextEditingController();
//   TextEditingController dateofau = TextEditingController();
//   TextEditingController divno = TextEditingController();
//   TextEditingController scnno = TextEditingController();
//   TextEditingController scndate = TextEditingController();
//   TextEditingController amtscn = TextEditingController();
//   TextEditingController reasonforclosure = TextEditingController();
//   TextEditingController dateofclosure = TextEditingController();
//   TextEditingController remarks = TextEditingController();
//   String? SCN;
//   List<String> objections = [];
//   List<double> amounts = [];
//
//   void _selectDate(BuildContext context, bool isStartDate) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2015, 8),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isStartDate) {
//           startdate.text = DateFormat("dd-MM-yyyy").format(picked);
//         } else {
//           enddate.text = DateFormat("dd-MM-yyyy").format(picked);
//         }
//       });
//     }
//   }
//
//   void _selectParaClosureDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2015, 8),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         paraclosuredate.text = DateFormat("dd-MM-yyyy").format(picked);
//       });
//     }
//   }
//   void _auditdate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2015, 8),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         dateofau.text = DateFormat("dd-MM-yyyy").format(picked);
//       });
//     }
//   }
//
//
//   void _addObjection() {
//     if (objection.text.isNotEmpty && amount.text.isNotEmpty) {
//       setState(() {
//         objections.add(objection.text);
//         double amountValue = double.tryParse(amount.text) ?? 0.0;
//         amounts.add(amountValue);
//         double currentTotal = 0.0;
//         for (var amount in amounts) {
//           currentTotal += amount;
//         }
//         total.text = currentTotal.toStringAsFixed(2); // Update the total amount
//         objection.clear();
//         amount.clear();
//       });
//     }
//   }
//
//   void _deleteObjection(int index) {
//     setState(() {
//       double deletedAmount = amounts[index];
//       objections.removeAt(index);
//       amounts.removeAt(index);
//       double currentTotal = double.tryParse(total.text) ?? 0.0;
//       total.text = (currentTotal - deletedAmount).toString();
//     });
//   }
//   void infoadd() async{
//     final response = await PostApiServices().getinfo(auditno.text, taxpayername.text, taxpayeraddress.text, rangeanddiv.text, regno.text, startdate.text, enddate.text, dateofau.text, objection.text, amount.text, total.text, SCN, divno.text, scnno.text, scndate.text, reasonforclosure.text,amtscn.text,dateofclosure.text, remarks.text
//
//     );
//     if(response["status"]=="success"){
//       print("addedd");
//     }
//     else{
//       print("error");
//     }
//   }
//
//
//   @override
//   void initState(){
//     super.initState() ;
//     total.text = '';
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => ViewPage()));
//                 // Add action for the "View Data" button
//               },
//               child: Text(
//                 'View Data',
//                 style: TextStyle(color: Colors.white),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Set button color to blue
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Audit Report No"),
//               SizedBox(height: 8),
//               TextField(
//                 controller: auditno,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text("Name of the taxpayer"),
//               SizedBox(height: 8),
//               TextField(
//                 controller: taxpayername,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text("Address of the taxpayer"),
//               SizedBox(height: 8),
//               TextField(
//                 controller: taxpayeraddress,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text("Range and division"),
//               SizedBox(height: 8),
//               TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text("Registration number of the taxpayer"),
//               SizedBox(height: 8),
//               TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text("Period of audit"),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: startdate,
//                       readOnly: true,
//                       onTap: () => _selectDate(context, true),
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Start Date',
//                         suffixIcon: Icon(Icons.calendar_today),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 16),
//                   Expanded(
//                     child: TextField(
//                       controller: enddate,
//                       readOnly: true,
//                       onTap: () => _selectDate(context, false),
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'End Date',
//                         suffixIcon: Icon(Icons.calendar_today),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Text("Date of audit"),
//               SizedBox(height: 8),
//               TextField(
//                 controller: dateofau,
//                 readOnly: true,
//                 onTap: () => _auditdate(context),
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Select Date',
//                   suffixIcon: Icon(Icons.calendar_today),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text("Objections"),
//               SizedBox(height: 8),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   for (int index = 0; index < objections.length; index++)
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 2,
//                           child: Text(objections[index]),
//                         ),
//                         Expanded(
//                           child: TextField(
//                             readOnly: true, // Make the amount field read-only
//                             controller: TextEditingController(
//                                 text: amounts[index].toString()),
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                               hintText: 'Amount',
//                             ),
//                           ),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.delete),
//                           onPressed: () => _deleteObjection(index),
//                         ),
//                       ],
//                     ),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 3,
//                     child: TextField(
//                       controller: objection,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Add Objection',
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: TextField(
//                       controller: amount,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Amount',
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   ElevatedButton(
//                     onPressed: _addObjection,
//                     child: Text('Add'),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8),
//               TextField(
//                 readOnly: true,
//                 controller: total,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Total',
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text("Is SCN needed"),
//               DropdownButtonFormField<String>(
//                 value: SCN,
//                 onChanged: (newValue) {
//                   if (newValue != null) {
//                     setState(() {
//                       SCN = newValue;
//                     });
//                   }
//                 },
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   fillColor: Color(0xFF0dadae0).withOpacity(0.2),
//                   filled: true,
//                 ),
//                 items: <String>['Yes', 'No']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               if (SCN == 'Yes') ...[
//                 Text("Divisional file number"),
//                 TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 Text("SCN no."),
//                 TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 Text("SCN date"),
//                 TextField(
//                   onTap: () => _selectDate(context, false),
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 Text("Amount demanded in SCN "),
//                 TextField(
//                   controller: amtscn,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 Text("Reasons for closure of para"),
//                 TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 Text("Date closure of para"),
//                 TextField(
//                   readOnly: true,
//                   onTap: () => _selectParaClosureDate(context),
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: 'Select Date of Para Closure',
//                     suffixIcon: Icon(Icons.calendar_today),
//                   ),
//                 ),
//                 Text("Remarks"),
//                 TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: 'Remarks',
//                   ),
//                 ),
//               ] else ...[
//                 ElevatedButton(
//                   onPressed: infoadd,
//                   child: Text('Save'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue, // Set save button color to blue
//                   ),
//                 ),
//               ],
//               SizedBox(height: 16),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: infoadd,
//                   child: Text('Submit'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue, // Set submit button color to blue
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ViewPage extends StatefulWidget {
//   const ViewPage({Key? key}) : super(key: key);
//
//   @override
//   State<ViewPage> createState() => _ViewPageState();
// }
//
// class _ViewPageState extends State<ViewPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
