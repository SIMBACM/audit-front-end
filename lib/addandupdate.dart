import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/login.dart';
import 'package:project/services/services.dart';

class addandupdate extends StatefulWidget {
  const addandupdate({Key? key}) : super(key: key);

  @override
  State<addandupdate> createState() => _addandupdateState();
}

class _addandupdateState extends State<addandupdate> {
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
  int _currentstep = 0;

  void _selectParaClosureDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        dateofclo.text = DateFormat("dd-MM-yyyy").format(picked);
      });
    }
  }

  void _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startdate.text = DateFormat("dd-MM-yyyy").format(picked);
        } else {
          enddate.text = DateFormat("dd-MM-yyyy").format(picked);
        }
      });
    }
  }

  void _auditdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        dateofau.text = DateFormat("dd-MM-yyyy").format(picked);
      });
    }
  }

  void _addObjection() {
    if (objection.text.isNotEmpty && amount.text.isNotEmpty) {
      setState(() {
        objections.add(objection.text);
        String amountValue = amount.text; // Changed to string
        amounts.add(amountValue);
        double currentTotal = 0.0;
        for (var amount in amounts) {
          currentTotal += double.tryParse(amount) ?? 0.0; // Parse amount as double here
        }
        total.text = currentTotal.toStringAsFixed(2); // Update the total amount
        objection.clear();
        amount.clear();
      });
    }
  }

  void _deleteObjection(int index) {
    setState(() {
      String deletedAmount = amounts[index]; // Change to String
      objections.removeAt(index);
      amounts.removeAt(index);
      double currentTotal = double.tryParse(total.text) ?? 0.0;
      double deletedAmountValue = double.tryParse(deletedAmount) ?? 0.0; // Parse deleted amount as double
      total.text = (currentTotal - deletedAmountValue).toStringAsFixed(2); // Update total as string
    });
  }

  void _closurepara() {
    if (reasonforclosure.text.isNotEmpty) {
      setState(() {
        closurepara.add(reasonforclosure.text);
        objection.clear();
      });
    }
  }

  void _deleteclosurepara(int index) {
    setState(() {
      closurepara.removeAt(index);
    });
  }

  List<Step> stepList() => [
    Step(
      title: Text('GST'),
      isActive: _currentstep >= 0,
      state: _currentstep <= 0 ? StepState.editing : StepState.complete,
      content: Column(
        children: [
          Text("Audit Report No"),
          SizedBox(height: 8),
          TextField(
            controller: auditno,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text("Name of the taxpayer"),
          SizedBox(height: 8),
          TextField(
            controller: taxpayername,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text("Address of the taxpayer"),
          SizedBox(height: 8),
          TextField(
            controller: taxpayeraddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text("Email"),
          SizedBox(height: 8),
          TextField(
            controller: email,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text("Range and division"),
          SizedBox(height: 8),
          TextField(
            controller: rangeanddivision,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text("Registration number of the taxpayer"),
          SizedBox(height: 8),
          TextField(
            controller: regno,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text("Period of audit"),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: startdate,
                  readOnly: true,
                  onTap: () => _selectDate(context, true),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Start Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: enddate,
                  readOnly: true,
                  onTap: () => _selectDate(context, false),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'End Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text("Date of audit"),
          SizedBox(height: 8),
          TextField(
            controller: dateofau,
            readOnly: true,
            onTap: () => _auditdate(context),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Select Date',
              suffixIcon: Icon(Icons.calendar_today),
            ),
          ),
          SizedBox(height: 16),
          Text("Objections"),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int index = 0; index < objections.length; index++)
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(objections[index]),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteObjection(index),
                    ),
                  ],
                ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: objection,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Add Objection',
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: amount,
                  keyboardType: TextInputType.number, // Set keyboard type to number
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Amount',
                  ),
                ),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: _addObjection,
                child: Text('Add'),
              ),
            ],
          ),
          Text("IAP NO."),
          TextField(
            controller: iapno,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Text("Name of superintendent"),
          TextField(
            controller: nameofsupdt,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          TextField(
            readOnly: true,
            controller: total,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Total',
            ),
          ),
        ],
      ),
    ),
    Step(
      title: Text('Recovery'),
      isActive: _currentstep >= 1,
      state: _currentstep <= 1 ? StepState.editing : StepState.complete,
      content: Column(
        children: [
          Text("Spot recovery"),
          TextField(
            controller: spot,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Text("Amount recoverd other than spot recovery"),
          TextField(
            controller: amountother,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    ),
    Step(
      title: Text('SCN'),
      isActive: _currentstep >= 2,
      state: StepState.complete,
      content: Column(
        children: [
          Text("Divisional file number"),
          TextField(
            controller: divno,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Text("SCN no."),
          TextField(
            controller: SCNno,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Text("SCN date"),
          TextField(
            controller: SCNdate,
            onTap: () => _selectDate(context, false),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Text("Amount demanded in SCN "),
          TextField(
            controller: amtscn,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Text("Reasons for closure of para"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int index = 0; index < closurepara.length; index++)
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(closurepara[index]),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteclosurepara(index),
                    ),
                  ],
                ),
            ],
          ),
          TextField(
            controller: reasonforclosure,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10), // Add some space between the text field and buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _closurepara,
                  child: Text("Add"),
                ),
              ),
            ],
          ),
          Text("Date closure of para"),
          TextField(
            controller: dateofclo,
            readOnly: true,
            onTap: () => _selectParaClosureDate(context),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Select Date of Para Closure',
              suffixIcon: Icon(Icons.calendar_today),
            ),
          ),
          Text("Remarks"),
          TextField(
            controller: remarks,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Remarks',
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Auditor Adding Page',
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
      body: Stepper(
        steps: stepList(),
        type: StepperType.horizontal,
        elevation: 0,
        currentStep: _currentstep,
        onStepContinue: () {
          if (_currentstep < (stepList().length - 1)) {
            setState(() {
              _currentstep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_currentstep > 0) {
            setState(() {
              _currentstep -= 1;
            });
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: _saveForm,
              child: Text("Save"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text("Submit"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveForm() async {
    try {
      final response = await PostApiServices().saveinfo(auditno.text,
          taxpayername.text,
          email.text,
          taxpayeraddress.text,
          rangeanddivision.text,
          regno.text,
          startdate.text,
          enddate.text,
          dateofau.text,
          iapno.text,
          nameofsupdt.text,
          objections,
          amounts,
          total.text,
          spot.text,
          amountother.text,
          divno.text,
          SCNno.text,
          SCNdate.text,
          amtscn.text,
          closurepara,
          dateofclo.text,
          remarks.text
      );


      if (response["status"] ==
          "Information saved, PDF generated, and email sent successfully") {
        print("added");
      } else {
        print("error");
      }
    } catch (e) {
      print("Exception occurred: $e");
    }
  }

  void _submitForm() {
    // Submit form logic
  }
}