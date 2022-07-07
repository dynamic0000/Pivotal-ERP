// import 'dart:convert';

// // // To parse this JSON data, do
// // //
// // //     final autoCompleteLedgerList = autoCompleteLedgerListFromMap(jsonString);

// // import 'dart:convert';

// // class AutoCompleteLedgerList {
// //   AutoCompleteLedgerList({
// //     required this.ledgerId,
// //     required this.ledgerGroupId,
// //     required this.name,
// //     required this.alias,
// //     required this.code,
// //     required this.ledgerGroup,
// //     required this.agent,
// //     required this.creditLimitAmount,
// //     required this.creditLimitDays,
// //     required this.area,
// //     required this.address,
// //     required this.debtorType,
// //     required this.debtorRoute,
// //     required this.panVatNo,
// //     required this.mobileNo1,
// //     required this.mobileNo2,
// //     required this.emailId,
// //   });

// //   int ledgerId;
// //   int ledgerGroupId;
// //   String name;
// //   String alias;
// //   String code;
// //   String ledgerGroup;
// //   String agent;
// //   int creditLimitAmount;
// //   int creditLimitDays;
// //   String area;
// //   String address;
// //   String debtorType;
// //   String debtorRoute;
// //   String panVatNo;
// //   String mobileNo1;
// //   String mobileNo2;
// //   String emailId;

// //   factory AutoCompleteLedgerList.fromJson(String str) =>
// //       AutoCompleteLedgerList.fromMap(json.decode(str));

// //   String toJson() => json.encode(toMap());

// //   factory AutoCompleteLedgerList.fromMap(Map<String, dynamic> json) =>
// //       AutoCompleteLedgerList(
// //         ledgerId: json["LedgerId"],
// //         ledgerGroupId: json["LedgerGroupId"],
// //         name: json["Name"],
// //         alias: json["Alias"],
// //         code: json["Code"],
// //         ledgerGroup: json["LedgerGroup"],
// //         agent: json["Agent"],
// //         creditLimitAmount: json["CreditLimitAmount"],
// //         creditLimitDays: json["CreditLimitDays"],
// //         area: json["Area"],
// //         address: json["Address"],
// //         debtorType: json["DebtorType"],
// //         debtorRoute: json["DebtorRoute"],
// //         panVatNo: json["PanVatNo"],
// //         mobileNo1: json["MobileNo1"],
// //         mobileNo2: json["MobileNo2"],
// //         emailId: json["EmailId"],
// //       );

// //   Map<String, Object> toMap() => {
// //         "LedgerId": ledgerId,
// //         "LedgerGroupId": ledgerGroupId,
// //         "Name": name,
// //         "Alias": alias,
// //         "Code": code,
// //         "LedgerGroup": ledgerGroup,
// //         "Agent": agent,
// //         "CreditLimitAmount": creditLimitAmount,
// //         "CreditLimitDays": creditLimitDays,
// //         "Area": area,
// //         "Address": address,
// //         "DebtorType": debtorType,
// //         "DebtorRoute": debtorRoute,
// //         "PanVatNo": panVatNo,
// //         "MobileNo1": mobileNo1,
// //         "MobileNo2": mobileNo2,
// //         "EmailId": emailId,
// //       };
// // }
import 'dart:developer';

/////////////////////////////////////////////////////2nddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd////////////////////////////
// class AutoCompleteLedgerList {
//   int ledgerId;
//   int ledgerGroupId;
//   String name;
//   String alias;
//   String code;
//   String ledgerGroup;
//   String agent;
//   int creditLimitAmount;
//   int creditLimitDays;
//   String area;
//   String address;
//   String debtorType;
//   String debtorRoute;
//   String panVatNo;
//   String mobileNo1;
//   String mobileNo2;
//   String emailId;
//   AutoCompleteLedgerList({
//     required this.ledgerId,
//     required this.ledgerGroupId,
//     required this.name,
//     required this.alias,
//     required this.code,
//     required this.ledgerGroup,
//     required this.agent,
//     required this.creditLimitAmount,
//     required this.creditLimitDays,
//     required this.area,
//     required this.address,
//     required this.debtorType,
//     required this.debtorRoute,
//     required this.panVatNo,
//     required this.mobileNo1,
//     required this.mobileNo2,
//     required this.emailId,
//   });

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     result.addAll({'ledgerId': ledgerId});
//     result.addAll({'ledgerGroupId': ledgerGroupId});
//     result.addAll({'name': name});
//     result.addAll({'alias': alias});
//     result.addAll({'code': code});
//     result.addAll({'ledgerGroup': ledgerGroup});
//     result.addAll({'agent': agent});
//     result.addAll({'creditLimitAmount': creditLimitAmount});
//     result.addAll({'creditLimitDays': creditLimitDays});
//     result.addAll({'area': area});
//     result.addAll({'address': address});
//     result.addAll({'debtorType': debtorType});
//     result.addAll({'debtorRoute': debtorRoute});
//     result.addAll({'panVatNo': panVatNo});
//     result.addAll({'mobileNo1': mobileNo1});
//     result.addAll({'mobileNo2': mobileNo2});
//     result.addAll({'emailId': emailId});

//     return result;
//   }

//   factory AutoCompleteLedgerList.fromMap(Map<String, dynamic> map) {
//     return AutoCompleteLedgerList(
//       ledgerId: map['ledgerId']?.toInt() ?? 0,
//       ledgerGroupId: map['ledgerGroupId']?.toInt() ?? 0,
//       name: map['name'] ?? '',
//       alias: map['alias'] ?? '',
//       code: map['code'] ?? '',
//       ledgerGroup: map['ledgerGroup'] ?? '',
//       agent: map['agent'] ?? '',
//       creditLimitAmount: map['creditLimitAmount']?.toInt() ?? 0,
//       creditLimitDays: map['creditLimitDays']?.toInt() ?? 0,
//       area: map['area'] ?? '',
//       address: map['address'] ?? '',
//       debtorType: map['debtorType'] ?? '',
//       debtorRoute: map['debtorRoute'] ?? '',
//       panVatNo: map['panVatNo'] ?? '',
//       mobileNo1: map['mobileNo1'] ?? '',
//       mobileNo2: map['mobileNo2'] ?? '',
//       emailId: map['emailId'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory AutoCompleteLedgerList.fromJson(String source) =>
//       AutoCompleteLedgerList.fromMap(json.decode(source));
//}
////////////////////////////////////////////////////////////////////////3rddddddddddddddddddddddddddddddddd////////////////////////////////////////////
// class Auto {
//   List<ArrayList> arrayList;
//   Auto({
//     required this.arrayList,
//   });

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     result.addAll({'arrayList': arrayList.map((x) => x.toMap()).toList()});

//     return result;
//   }

//   factory Auto.fromMap(Map<String, dynamic> map) {
//     return Auto(
//       arrayList: List<ArrayList>.from(
//           map['arrayList']?.map((x) => ArrayList.fromMap(x))),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Auto.fromJson(String source) => Auto.fromMap(json.decode(source));
// }

// class ArrayList {
//   int ledgerId;
//   int ledgerGroupId;
//   String name;
//   String alias;
//   String code;
//   String ledgerGroup;
//   String agent;
//   int creditLimitAmount;
//   int creditLimitDays;
//   String area;
//   String address;
//   String debtorType;
//   String debtorRoute;
//   String panVatNo;
//   String mobileNo1;
//   String mobileNo2;
//   String emailId;
//   ArrayList({
//     required this.ledgerId,
//     required this.ledgerGroupId,
//     required this.name,
//     required this.alias,
//     required this.code,
//     required this.ledgerGroup,
//     required this.agent,
//     required this.creditLimitAmount,
//     required this.creditLimitDays,
//     required this.area,
//     required this.address,
//     required this.debtorType,
//     required this.debtorRoute,
//     required this.panVatNo,
//     required this.mobileNo1,
//     required this.mobileNo2,
//     required this.emailId,
//   });

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     result.addAll({'ledgerId': ledgerId});
//     result.addAll({'ledgerGroupId': ledgerGroupId});
//     result.addAll({'name': name});
//     result.addAll({'alias': alias});
//     result.addAll({'code': code});
//     result.addAll({'ledgerGroup': ledgerGroup});
//     result.addAll({'agent': agent});
//     result.addAll({'creditLimitAmount': creditLimitAmount});
//     result.addAll({'creditLimitDays': creditLimitDays});
//     result.addAll({'area': area});
//     result.addAll({'address': address});
//     result.addAll({'debtorType': debtorType});
//     result.addAll({'debtorRoute': debtorRoute});
//     result.addAll({'panVatNo': panVatNo});
//     result.addAll({'mobileNo1': mobileNo1});
//     result.addAll({'mobileNo2': mobileNo2});
//     result.addAll({'emailId': emailId});

//     return result;
//   }

//   factory ArrayList.fromMap(Map<String, dynamic> map) {
//     return ArrayList(
//       ledgerId: map['ledgerId']?.toInt() ?? 0,
//       ledgerGroupId: map['ledgerGroupId']?.toInt() ?? 0,
//       name: map['name'] ?? '',
//       alias: map['alias'] ?? '',
//       code: map['code'] ?? '',
//       ledgerGroup: map['ledgerGroup'] ?? '',
//       agent: map['agent'] ?? '',
//       creditLimitAmount: map['creditLimitAmount']?.toInt() ?? 0,
//       creditLimitDays: map['creditLimitDays']?.toInt() ?? 0,
//       area: map['area'] ?? '',
//       address: map['address'] ?? '',
//       debtorType: map['debtorType'] ?? '',
//       debtorRoute: map['debtorRoute'] ?? '',
//       panVatNo: map['panVatNo'] ?? '',
//       mobileNo1: map['mobileNo1'] ?? '',
//       mobileNo2: map['mobileNo2'] ?? '',
//       emailId: map['emailId'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ArrayList.fromJson(String source) =>
//       ArrayList.fromMap(json.decode(source));
// }

class AutoCompleteLedgerList {
  int? ledgerId;
  int? ledgerGroupId;
  String? name;
  String? alias;
  String? code;
  String? ledgerGroup;
  String? agent;
  double? creditLimitAmount;
  int? creditLimitDays;
  String? area;
  String? address;
  String? debtorType;
  String? debtorRoute;
  String? panVatNo;
  String? mobileNo1;
  String? mobileNo2;
  String? emailId;

  AutoCompleteLedgerList(
      {this.ledgerId,
      this.ledgerGroupId,
      this.name,
      this.alias,
      this.code,
      this.ledgerGroup,
      this.agent,
      this.creditLimitAmount,
      this.creditLimitDays,
      this.area,
      this.address,
      this.debtorType,
      this.debtorRoute,
      this.panVatNo,
      this.mobileNo1,
      this.mobileNo2,
      this.emailId});

  AutoCompleteLedgerList.fromJson(Map<String, dynamic> json) {
    log('jsonnnnn$json');

    ledgerId = int.parse(json['LedgerId'].toString());
    log('ledgerid print $ledgerId');
    ledgerGroupId = json['LedgerGroupId'];
    name = json['Name'];
    alias = json['Alias'];
    code = json['Code'];
    ledgerGroup = json['LedgerGroup'];
    agent = json['Agent'];
    creditLimitAmount = json['CreditLimitAmount'];
    creditLimitDays = json['CreditLimitDays'];
    area = json['Area'];
    address = json['Address'];
    debtorType = json['DebtorType'];
    debtorRoute = json['DebtorRoute'];
    panVatNo = json['PanVatNo'];
    mobileNo1 = json['MobileNo1'];
    mobileNo2 = json['MobileNo2'];
    emailId = json['EmailId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LedgerId'] = ledgerId;
    data['LedgerGroupId'] = ledgerGroupId;
    data['Name'] = name;
    data['Alias'] = alias;
    data['Code'] = code;
    data['LedgerGroup'] = ledgerGroup;
    data['Agent'] = agent;
    data['CreditLimitAmount'] = creditLimitAmount;
    data['CreditLimitDays'] = creditLimitDays;
    data['Area'] = area;
    data['Address'] = address;
    data['DebtorType'] = debtorType;
    data['DebtorRoute'] = debtorRoute;
    data['PanVatNo'] = panVatNo;
    data['MobileNo1'] = mobileNo1;
    data['MobileNo2'] = mobileNo2;
    data['EmailId'] = emailId;
    return data;
  }
}
