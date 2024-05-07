import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/models/infomodel.dart';
import 'package:project/models/signupmodel.dart';

class PostApiServices {
  Future<dynamic> sendData(String username,
      String email,
      String password,) async {
    var client = http.Client();
    var apiurl = Uri.parse("http://10.0.16.132:3001/register/signup");
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
    var apiUrl = Uri.parse("http://10.0.16.132:3001/register/signin");
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
    var apiUrl = Uri.parse("http://10.0.16.132:3001/register/forgotpassword");
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

  Future<dynamic> saveinfo(
      String auditno,
      String taxpayername,
      String email,
      String taxpayeraddress,
      String rangeanddivision,
      String regno,
      String startdate,
      String enddate,
      String dateofau,
      String iapno,
      String nameofsupdt,
      List<String> objections, // Pass objections as a list of strings, // Pass amounts as a list of strings
      List<String> amounts, // Pass objections as a list of strings, // Pass amounts as a list of strings
      String total,
      String spot,
      String amountother,
      String divno,
      String SCNno,
      String SCNdate,
      String amtscn,
      List<String> closurepara,
      String dateofclo,
      String remarks,
      ) async {
    var apiUrl = Uri.parse("http://10.0.16.132:3001/audit/saveInformation");
    var response = await http.post(
      apiUrl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, dynamic>{
        "auditReportNo": auditno,
        "nameOfTheTaxpayer": taxpayername,
        "email": email,
        "addressOfTheTaxpayer": taxpayeraddress,
        "rangeAndDivision": rangeanddivision,
        "registrationNumberOfTheTaxpayer": regno,
        "startDate": startdate,
        "endDate": enddate,
        "dateOfAudit": dateofau,
        "objectionInBriefForEachPara": objections, // Pass objections array
        "IAPno": iapno,
        "Nameofsupdt": nameofsupdt,
        "duty": amounts, // Pass amounts array
        "total": total,
        "spotrecovery":spot,
        "taxrecoverd":amountother,
        "divisionalFileNumber":divno,
        "scnNo":SCNno,
        "scnDate":SCNdate,
        "amountDemandedInScn":amtscn,
        "reasonsForClosureOfPara":closurepara,
        "dateClosureOfPara":dateofclo,
        "remarks":remarks,
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
        Uri.parse("http://10.0.16.132:3001/admin/viewallreq"));
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

  Future<List<Audit>> infosave() async {
    final response = await http.get(
        Uri.parse("http://10.0.16.132:3001/audit/view"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['status'] == "success") {
        final List<dynamic> jsonData = responseData['data'];
        return jsonData.map((data) => Audit.fromJson(data)).toList();
      } else {
        throw Exception(
            'Failed to fetch user details: ${responseData['message']}');
      }
    } else {
      throw Exception('Failed to fetch user details');
    }
  }

  Future<dynamic> acceptuser(String id) async {

    var client = http.Client();
    var apiUri = Uri.parse("http://10.0.16.132:3001/admin/acceptuser");
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
    var apiUri = Uri.parse("http://10.0.16.132:3001/admin/rejectuser");
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

  Future<List<Posts>> Acceptedusers() async {
    var client = http.Client();
    var apiUrl = Uri.parse("http://10.0.16.132:3001/admin/acceptedusers");

    var response = await client.get(apiUrl);
    if (response.statusCode == 200) {
      return postsFromJson(response.body);
    }
    else {
      return [];
    }
  }

  Future<dynamic> updateinfo(
  String auditno,
      ) async{
    var apiUrl = Uri.parse("http://10.0.16.132:3001/audit/getauditid");
    var response = await http.post(
      apiUrl,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, dynamic>{
        "auditReportNo": auditno,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed");
    }
  }


  static Future<String?> downloadData() async {
    final url = Uri.parse('http://10.0.16.132:3001/audit/download');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // If the server returns a success response, return the JSON data
        return response.body;
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to download data: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors that occur during the process
      print('Error downloading data: $error');
      throw Exception('Failed to download data');
    }
  }
}




