// import 'dart:convert';

// class LedgerDetials {
//   int? ledgerId;
//   int? groupId;
//   String? name;
//   String? alias;
//   String? code;
//   String? groupName;
//   String? agent;
//   int? creditLimitAmt;
//   int? creditLimitDays;
//   String? area;
//   String? address;
//   String? debtorType;
//   String? debtorRoute;
//   String? panVat;
//   String? mobileNo1;
//   String? mobileNo2;
//   String? emailId;
//   int? opening;
//   int? drAmt;
//   int? crAmt;
//   int? closing;
//   int? tranAmt;
//   Null? lastTranDateAD;
//   String? lastTranDateBS;
//   int? bGAmt;
//   LedgerDetials({
//     this.ledgerId,
//     this.groupId,
//     this.name,
//     this.alias,
//     this.code,
//     this.groupName,
//     this.agent,
//     this.creditLimitAmt,
//     this.creditLimitDays,
//     this.area,
//     this.address,
//     this.debtorType,
//     this.debtorRoute,
//     this.panVat,
//     this.mobileNo1,
//     this.mobileNo2,
//     this.emailId,
//     this.opening,
//     this.drAmt,
//     this.crAmt,
//     this.closing,
//     this.tranAmt,
//     this.lastTranDateAD,
//     this.lastTranDateBS,
//     this.bGAmt,
//   });

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};
  
//     if(ledgerId != null){
//       result.addAll({'ledgerId': ledgerId});
//     }
//     if(groupId != null){
//       result.addAll({'groupId': groupId});
//     }
//     if(name != null){
//       result.addAll({'name': name});
//     }
//     if(alias != null){
//       result.addAll({'alias': alias});
//     }
//     if(code != null){
//       result.addAll({'code': code});
//     }
//     if(groupName != null){
//       result.addAll({'groupName': groupName});
//     }
//     if(agent != null){
//       result.addAll({'agent': agent});
//     }
//     if(creditLimitAmt != null){
//       result.addAll({'creditLimitAmt': creditLimitAmt});
//     }
//     if(creditLimitDays != null){
//       result.addAll({'creditLimitDays': creditLimitDays});
//     }
//     if(area != null){
//       result.addAll({'area': area});
//     }
//     if(address != null){
//       result.addAll({'address': address});
//     }
//     if(debtorType != null){
//       result.addAll({'debtorType': debtorType});
//     }
//     if(debtorRoute != null){
//       result.addAll({'debtorRoute': debtorRoute});
//     }
//     if(panVat != null){
//       result.addAll({'panVat': panVat});
//     }
//     if(mobileNo1 != null){
//       result.addAll({'mobileNo1': mobileNo1});
//     }
//     if(mobileNo2 != null){
//       result.addAll({'mobileNo2': mobileNo2});
//     }
//     if(emailId != null){
//       result.addAll({'emailId': emailId});
//     }
//     if(opening != null){
//       result.addAll({'opening': opening});
//     }
//     if(drAmt != null){
//       result.addAll({'drAmt': drAmt});
//     }
//     if(crAmt != null){
//       result.addAll({'crAmt': crAmt});
//     }
//     if(closing != null){
//       result.addAll({'closing': closing});
//     }
//     if(tranAmt != null){
//       result.addAll({'tranAmt': tranAmt});
//     }
//     if(lastTranDateAD != null){
//       result.addAll({'lastTranDateAD': lastTranDateAD!.toMap()});
//     }
//     if(lastTranDateBS != null){
//       result.addAll({'lastTranDateBS': lastTranDateBS});
//     }
//     if(bGAmt != null){
//       result.addAll({'bGAmt': bGAmt});
//     }
  
//     return result;
//   }

//   factory LedgerDetials.fromMap(Map<String, dynamic> map) {
//     return LedgerDetials(
//       ledgerId: map['ledgerId']?.toInt(),
//       groupId: map['groupId']?.toInt(),
//       name: map['name'],
//       alias: map['alias'],
//       code: map['code'],
//       groupName: map['groupName'],
//       agent: map['agent'],
//       creditLimitAmt: map['creditLimitAmt']?.toInt(),
//       creditLimitDays: map['creditLimitDays']?.toInt(),
//       area: map['area'],
//       address: map['address'],
//       debtorType: map['debtorType'],
//       debtorRoute: map['debtorRoute'],
//       panVat: map['panVat'],
//       mobileNo1: map['mobileNo1'],
//       mobileNo2: map['mobileNo2'],
//       emailId: map['emailId'],
//       opening: map['opening']?.toInt(),
//       drAmt: map['drAmt']?.toInt(),
//       crAmt: map['crAmt']?.toInt(),
//       closing: map['closing']?.toInt(),
//       tranAmt: map['tranAmt']?.toInt(),
//       lastTranDateAD: map['lastTranDateAD'] != null ? Null.fromMap(map['lastTranDateAD']) : null,
//       lastTranDateBS: map['lastTranDateBS'],
//       bGAmt: map['bGAmt']?.toInt(),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory LedgerDetials.fromJson(String source) => LedgerDetials.fromMap(json.decode(source));
// }
