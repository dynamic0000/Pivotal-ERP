// // To parse this JSON data, do
// //
// //     final getVoucherModes = getVoucherModesFromMap(jsonString);

// import 'dart:convert';

// // List<GetVoucherModes> getVoucherModes(String str) => List<GetVoucherModes>.from(
// //     json.decode(str).map((x) => GetVoucherModes.fromJson(x)));

// // String getVoucherModesToJson(List<GetVoucherModes> data) =>
// //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class GetVoucherModes {
//   GetVoucherModes({
//     required this.voucherId,
//     required this.voucherName,
//     required this.voucherType,
//     required this.abbreviation,
//     required this.responseMsg,
//     required this.isSuccess,
//   });

//   int voucherId;
//   String voucherName;
//   int voucherType;
//   String abbreviation;
//   String responseMsg;
//   bool isSuccess;

//   factory GetVoucherModes.fromJson(String str) =>
//       GetVoucherModes.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory GetVoucherModes.fromMap(Map<String, dynamic> json) => GetVoucherModes(
//         voucherId: json["VoucherId"],
//         voucherName: json["VoucherName"],
//         voucherType: json["VoucherType"],
//         abbreviation: json["Abbreviation"],
//         responseMsg: json["ResponseMSG"],
//         isSuccess: json["IsSuccess"],
//       );

//   Map<String, dynamic> toMap() => {
//         "VoucherId": voucherId,
//         "VoucherName": voucherName,
//         "VoucherType": voucherType,
//         "Abbreviation": abbreviation,
//         "ResponseMSG": responseMsg,
//         "IsSuccess": isSuccess,
//       };
// }
/////////////////////////////////

class GetVoucherModes {
  int? voucherId;
  String? voucherName;
  int? voucherType;
  String? abbreviation;
  String? responseMSG;
  bool? isSuccess;

  GetVoucherModes(
      {this.voucherId,
      this.voucherName,
      this.voucherType,
      this.abbreviation,
      this.responseMSG,
      this.isSuccess});

  GetVoucherModes.fromJson(Map<String, dynamic> json) {
    voucherId = json['VoucherId'];
    voucherName = json['VoucherName'];
    voucherType = json['VoucherType'];
    abbreviation = json['Abbreviation'];
    responseMSG = json['ResponseMSG'];
    isSuccess = json['IsSuccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['VoucherId'] = voucherId;
    data['VoucherName'] = voucherName;
    data['VoucherType'] = voucherType;
    data['Abbreviation'] = abbreviation;
    data['ResponseMSG'] = responseMSG;
    data['IsSuccess'] = isSuccess;
    return data;
  }
}
