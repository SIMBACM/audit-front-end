import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'package:project/models/infomodel.dart';


class adminDetailsScreen extends StatefulWidget {
  final Audit userDetails;

  const adminDetailsScreen({Key? key, required this.userDetails}) : super(key: key);

  @override
  State<adminDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<adminDetailsScreen> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Full details of the Audit',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            icon: Icon(Icons.logout, color: Colors.white),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildRow('Audit report no:', widget.userDetails.auditReportNo),
              buildRow('Taxpayer Name:', widget.userDetails.nameOfTheTaxpayer),
              buildRow('Email:', widget.userDetails.email),
              buildRow('Address:', widget.userDetails.addressOfTheTaxpayer),
              buildRow('Range and Division:', widget.userDetails.rangeAndDivision),
              buildRow('Registration Number:', widget.userDetails.registrationNumberOfTheTaxpayer),
              buildRow('Start Date:', widget.userDetails.startDate.toString()),
              buildRow('End Date:', widget.userDetails.endDate.toString()),
              buildRow('Date of Audit:', widget.userDetails.dateOfAudit.toString()),
              buildRow('IA Pno:', widget.userDetails.iaPno),
              buildRow('Name of Supdt:', widget.userDetails.nameofsupdt),
              buildRow('Objections in Brief:', widget.userDetails.objectionInBriefForEachPara.join(', ')),
              buildRow('Duty:', widget.userDetails.duty.join(', ')),
              buildRow('Total:', widget.userDetails.total),
              buildRow('Spot Recovery:', widget.userDetails.spotrecovery),
              buildRow('Tax Recovered:', widget.userDetails.taxrecoverd),
              buildRow('Divisional File Number:', widget.userDetails.divisionalFileNumber),
              buildRow('SCN Number:', widget.userDetails.scnNo),
              buildRow('SCN Date:', widget.userDetails.scnDate.toString()),
              buildRow('Amount Demanded in SCN:', widget.userDetails.amountDemandedInScn),
              buildRow('Reasons for Closure of Para:', widget.userDetails.reasonsForClosureOfPara.join(', ')),
              buildRow('Date of Closure of Para:', widget.userDetails.dateClosureOfPara.toString()),
              buildRow('Remarks:', widget.userDetails.remarks),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(String heading, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(
              content,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }


}
