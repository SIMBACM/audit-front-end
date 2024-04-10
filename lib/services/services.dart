import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/models/signupmodel.dart';

class PostApiServices {
  Future<dynamic> sendData(String username,
      String email,
      String password,) async {
    var client = http.Client();
    var apiurl = Uri.parse("http://10.0.20.142:3001/register/signup");
    var response = await client.post(apiurl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, String>{

        "username": username,
        "email": email,
        "password": password,

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

  Future<dynamic> getpost(String email,
      String password) async {
    var apiUrl = Uri.parse("http://10.0.20.142:3001/register/signin");
    var response = await http.post(apiUrl,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          "email": email,
          "password": password
        })
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception("Failed");
    }
  }

  Future<dynamic> forgotpassword(String email,
      String newpassword,
      String confirmpassword,) async {
    var apiUrl = Uri.parse("http://10.0.20.142:3001/register/forgotpassword");
    var response = await http.post(
      apiUrl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "new_password": newpassword,
        "confirm_password": confirmpassword,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to initiate password reset");
    }
  }

  Future<dynamic> saveinfo(String auditno,
      String taxpayername,
      String email,
      String taxpayeraddress,
      String rangeanddiv,
      String regno,
      String startdate,
      String enddate,
      String dateofau,
      String iapno,
      String nameofsupdt,
      String objection,
      String amount,
      String total,
      ) async {
    var apiUrl = Uri.parse("http://10.0.20.142:3001/audit/saveInformation");
    var response = await http.post(
      apiUrl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },

      body: jsonEncode(<String, String>{
        "auditReportNo": auditno,
        "nameOfTheTaxpayer": taxpayername,
        "email":email,
        "addressOfTheTaxpayer": taxpayeraddress,
        "rangeAndDivision": rangeanddiv,
        "registrationNumberOfTheTaxpayer": regno,
        "startDate": startdate,
        "endDate": enddate,
        "dateOfAudit": dateofau,
        "objectionInBriefForEachPara": objection,
        "IAPno":iapno,
        "Nameofsupdt":nameofsupdt,
        "duty": amount,
        "total": total,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed");
    }
  }

   Future<List<Posts>> fetchAllUserDetails() async {
    final response = await http.get(
        Uri.parse("http://10.0.20.142:3001/admin/viewallreq"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['status'] == "success") {
        final List<dynamic> jsonData = responseData['data'];
        return jsonData.map((data) => Posts.fromJson(data)).toList();
      } else {
        throw Exception(
            'Failed to fetch user details: ${responseData['message']}');
      }
    } else {
      throw Exception('Failed to fetch user details');
    }
  }

  // Future<dynamic> acceptuser(String id,) async {
  //   var apiUrl = Uri.parse("http://10.0.20.142:3001/register/accept/id:");
  //   var response = await http.post(apiUrl,
  //     headers: <String, String>{
  //       "Content-Type": "application/json; charset=UTF-8"
  //     },
  //     body: jsonEncode(<String, String>{
  //       "id": id,
  //     }),
  //
  //   );
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception("Failed");
  //   }
  // }
  Future<dynamic> acceptuser(String id) async {

    var client = http.Client();
    var apiUri = Uri.parse("http://10.0.20.142:3001/admin/acceptuser");
    var response = await client.post(apiUri,
      headers: <String, String>
      {
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, String>
      { "_id": id,
      }
      ),
    );
    if (response.statusCode == 200) {
      var resp = response.body;
      return jsonDecode(resp);
    }
    else {
      throw Exception("Failed to send data");
    }
  }


  Future<dynamic> reject(String id) async {

    var client = http.Client();
    var apiUri = Uri.parse("http://10.0.20.142:3001/admin/rejectuser");
    var response = await client.post(apiUri,
      headers: <String, String>
      {
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, String>
      { "_id": id,
      }
      ),
    );
    if (response.statusCode == 200) {
      var resp = response.body;
      return jsonDecode(resp);
    }
    else {
      throw Exception("Failed to send data");
    }
  }
}



