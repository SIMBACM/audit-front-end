import 'dart:convert';
import 'package:http/http.dart' as http;
class PostApiServices {
  Future<dynamic> sendData(String username,
      String email,
      String password,
      String confirm_password
      ) async {
    var client = http.Client();
    var apiurl = Uri.parse("http://localhost:3001/register/signup");
    var response = await client.post(apiurl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, String>{

        "username": username,
        "email": email,
        "password": password,
        "confirm_password":confirm_password

      }
      ),

    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception("Failed");
    }
  }
  Future<dynamic> getpost(
      String email,
      String password
      ) async {
    var client = http.Client();
    var apiurl = Uri.parse("http://localhost:3001/register/signin");
    var response = await client.post(apiurl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password

      }
      ),

    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception("Failed");
    }
  }
  Future<dynamic> forgotpassword(String email) async {
    var apiUrl = Uri.parse("http://localhost:3001/register/forgotpassword");
    var response = await http.post(apiUrl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, String>{
        "email": email,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to initiate password reset");
    }
  }

}


