import 'dart:convert';

Audit auditFromJson(String str) => Audit.fromJson(json.decode(str));

String auditToJson(Audit data) => json.encode(data.toJson());

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
  String spotrecovery;
  String taxrecoverd;
  String divisionalFileNumber;
  String scnNo;
  String scnDate;
  String amountDemandedInScn;
  List<String> reasonsForClosureOfPara;
  String dateClosureOfPara;
  String remarks;
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
    required this.spotrecovery,
    required this.taxrecoverd,
    required this.divisionalFileNumber,
    required this.scnNo,
    required this.scnDate,
    required this.amountDemandedInScn,
    required this.reasonsForClosureOfPara,
    required this.dateClosureOfPara,
    required this.remarks,
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
    startDate: (json["startDate"]),
    endDate: (json["endDate"]),
    dateOfAudit: (json["dateOfAudit"]),
    iaPno: json["IAPno"],
    nameofsupdt: json["Nameofsupdt"],
    objectionInBriefForEachPara:
    List<String>.from(json["objectionInBriefForEachPara"].map((x) => x)),
    duty: List<String>.from(json["duty"].map((x) => x)),
    total: json["total"],
    spotrecovery: json["spotrecovery"],
    taxrecoverd: json["taxrecoverd"],
    divisionalFileNumber: json["divisionalFileNumber"],
    scnNo: json["scnNo"],
    scnDate: (json["scnDate"]),
    amountDemandedInScn: json["amountDemandedInScn"],
    reasonsForClosureOfPara:
    List<String>.from(json["reasonsForClosureOfPara"].map((x) => x)),
    dateClosureOfPara: (json["dateClosureOfPara"]),
    remarks: json["remarks"],
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
    "spotrecovery": spotrecovery,
    "taxrecoverd": taxrecoverd,
    "divisionalFileNumber": divisionalFileNumber,
    "scnNo": scnNo,
    "scnDate": scnDate,
    "amountDemandedInScn": amountDemandedInScn,
    "reasonsForClosureOfPara": List<dynamic>.from(reasonsForClosureOfPara.map((x) => x)),
    "dateClosureOfPara": dateClosureOfPara,
    "remarks": remarks,
    "__v": v,
  };

}
