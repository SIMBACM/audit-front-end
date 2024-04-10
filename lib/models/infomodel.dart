// To parse this JSON data, do
//
//     final audit = auditFromJson(jsonString);

import 'dart:convert';

List<Audit> auditFromJson(String str) => List<Audit>.from(json.decode(str).map((x) => Audit.fromJson(x)));

String auditToJson(List<Audit> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Audit {
  String id;
  String auditReportNo;
  String nameOfTheTaxpayer;
  String email;
  String addressOfTheTaxpayer;
  String rangeAndDivision;
  String registrationNumberOfTheTaxpayer;
  String startDate;
  String endDate;
  String dateOfAudit;
  String iaPno;
  String nameofsupdt;
  List<String> objectionInBriefForEachPara;
  List<String> duty;
  String total;
  int v;

  Audit({
    required this.id,
    required this.auditReportNo,
    required this.nameOfTheTaxpayer,
    required this.email,
    required this.addressOfTheTaxpayer,
    required this.rangeAndDivision,
    required this.registrationNumberOfTheTaxpayer,
    required this.startDate,
    required this.endDate,
    required this.dateOfAudit,
    required this.iaPno,
    required this.nameofsupdt,
    required this.objectionInBriefForEachPara,
    required this.duty,
    required this.total,
    required this.v,
  });

  factory Audit.fromJson(Map<String, dynamic> json) => Audit(
    id: json["_id"],
    auditReportNo: json["auditReportNo"],
    nameOfTheTaxpayer: json["nameOfTheTaxpayer"],
    email: json["email"],
    addressOfTheTaxpayer: json["addressOfTheTaxpayer"],
    rangeAndDivision: json["rangeAndDivision"],
    registrationNumberOfTheTaxpayer: json["registrationNumberOfTheTaxpayer"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    dateOfAudit: json["dateOfAudit"],
    iaPno: json["IAPno"],
    nameofsupdt: json["Nameofsupdt"],
    objectionInBriefForEachPara: List<String>.from(json["objectionInBriefForEachPara"].map((x) => x)),
    duty: List<String>.from(json["duty"].map((x) => x)),
    total: json["total"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "auditReportNo": auditReportNo,
    "nameOfTheTaxpayer": nameOfTheTaxpayer,
    "email": email,
    "addressOfTheTaxpayer": addressOfTheTaxpayer,
    "rangeAndDivision": rangeAndDivision,
    "registrationNumberOfTheTaxpayer": registrationNumberOfTheTaxpayer,
    "startDate": startDate,
    "endDate": endDate,
    "dateOfAudit": dateOfAudit,
    "IAPno": iaPno,
    "Nameofsupdt": nameofsupdt,
    "objectionInBriefForEachPara": List<dynamic>.from(objectionInBriefForEachPara.map((x) => x)),
    "duty": List<dynamic>.from(duty.map((x) => x)),
    "total": total,
    "__v": v,
  };
}
