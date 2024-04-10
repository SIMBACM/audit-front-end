import 'package:flutter/material.dart';
import 'package:project/services/services.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String errorMessage = '';

  void simplePopup(BuildContext context,String s){
    final snackBar=SnackBar(
      content: Text(s,style: TextStyle(color: Colors.blue),),
      duration: Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void sendValuesToApi() async {
    try {
      final response = await PostApiServices().sendData(
        username.text,
        email.text,
        password.text,
      );

      if (response["status"] == "success") {
        setState(() {
          simplePopup(context, "User signed up successfully");
        });
        // Navigate to success screen or do something else
      } else if (response["status"] == "passwordMismatch") {
        setState(() {
          errorMessage = "Passwords do not match";
        });
      } else if (response["status"] == "tempsuccess") {
        setState(() {
          simplePopup(context, "Temporary User signed up successfully");
        });
      } else {
        setState(() {
          simplePopup(context, "Something went wrong");
        });
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        errorMessage = 'An error occurred. Please try again.';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Create an account, It's free ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    inputFile(label: "Username", controller: username),
                    inputFile(label: "Email", controller: email),
                    inputFile(label: "Password", obscureText: true, controller: password),
                    inputFile(label: "Confirm Password ", obscureText: true),
                  ],
                ),
              ),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  ),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: sendValuesToApi,
                  color: Color(0xff0095FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  Text(
                    " Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget inputFile({required String label, TextEditingController? controller, bool obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      SizedBox(height: 5),
      TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}
