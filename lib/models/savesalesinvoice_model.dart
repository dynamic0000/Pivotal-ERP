// // To parse this JSON data, do
// //
// //     final saveSalesInvoice = saveSalesInvoiceFromMap(jsonString);

// import 'dart:convert';

// class SaveSalesInvoice {
//     SaveSalesInvoice({
//        required this.aditionalCostColl,
//         required this.itemAllocationColl,
//         required this.manualVoucherNo,
//         required this.narration,
//         required this.partyLedgerId,
//         required this.refNo,
//         required this.totalAmount,
//         required this.voucherDate,
//         required this.voucherId,
//     });

//     List<dynamic> aditionalCostColl;
//     List<Map<String, double>> itemAllocationColl;
//     String manualVoucherNo;
//     String narration;
//     int partyLedgerId;
//     String refNo;
//     double totalAmount;
//     String voucherDate;
//     int voucherId;

//     factory   (String str) => SaveSalesInvoice.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory SaveSalesInvoice.fromMap(Map<String, dynamic> json) => SaveSalesInvoice(
//         aditionalCostColl: List<dynamic>.from(json["aditionalCostColl"].map((x) => x)),
//         itemAllocationColl: List<Map<String, double>>.from(json["itemAllocationColl"].map((x) => Map.from(x).map((k, v) => MapEntry<String, double>(k, v.toDouble())))),
//         manualVoucherNo: json["manualVoucherNO"],
//         narration: json["narration"],
//         partyLedgerId: json["partyLedgerId"],
//         refNo: json["refNo"],
//         totalAmount: json["totalAmount"].toDouble(),
//         voucherDate: json["voucherDate"],
//         voucherId: json["voucherId"],
//     );

//     Map<String, dynamic> toMap() => {
//         "aditionalCostColl": List<dynamic>.from(aditionalCostColl.map((x) => x)),
//         "itemAllocationColl": List<dynamic>.from(itemAllocationColl.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
//         "manualVoucherNO": manualVoucherNo,
//         "narration": narration,
//         "partyLedgerId": partyLedgerId,
//         "refNo": refNo,
//         "totalAmount": totalAmount,
//         "voucherDate": voucherDate,
//         "voucherId": voucherId,
//     };
// }
////////////////111111111111111111111111111111111111111111111////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// To parse this JSON data, do

//     final saveSalesInvoice = saveSalesInvoiceFromJson(jsonString);

// import 'dart:convert';
// SaveSalesInvoice saveSalesInvoiceFromJson(String str) =>
//     SaveSalesInvoice.fromJson(json.decode(str));
// String saveSalesInvoiceToJson(SaveSalesInvoice data) =>
//     json.encode(data.toJson());
//     class SaveSalesInvoice {
//   SaveSalesInvoice({
//     required this.aditionalCostColl,
//     required this.itemAllocationColl,
//     required this.manualVoucherNo,
//     required this.narration,
//     required this.partyLedgerId,
//     required this.refNo,
//     required this.totalAmount,
//     required this.voucherDate,
//     required this.voucherId,
//   });
// List<dynamic> aditionalCostColl;
//   List<Map<String, double>> itemAllocationColl;
//   String manualVoucherNo;
//   String narration;
//   int partyLedgerId;
//   String refNo;
//   double totalAmount;
//   String voucherDate;
//   int voucherId;
// factory SaveSalesInvoice.fromJson(Map<String, dynamic> json) =>
//       SaveSalesInvoice(
//         aditionalCostColl:
//             List<dynamic>.from(json["aditionalCostColl"].map((x) => x)),
//         itemAllocationColl: List<Map<String, double>>.from(
//             json["itemAllocationColl"].map((x) => Map.from(x)
//                 .map((k, v) => MapEntry<String, double>(k, v.toDouble())))),
//         manualVoucherNo: json["manualVoucherNO"],
//         narration: json["narration"],
//         partyLedgerId: json["partyLedgerId"],
//         refNo: json["refNo"],
//         totalAmount: json["totalAmount"].toDouble(),
//         voucherDate: json["voucherDate"],
//         voucherId: json["voucherId"],
//       );
//  Map<String, dynamic> toJson() => {
//         "aditionalCostColl":
//             List<dynamic>.from(aditionalCostColl.map((x) => x)),
//         "itemAllocationColl": List<dynamic>.from(itemAllocationColl.map(
//             (x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
//         "manualVoucherNO": manualVoucherNo,
//         "narration": narration,
//         "partyLedgerId": partyLedgerId,
//         "refNo": refNo,
//         "totalAmount": totalAmount,
//         "voucherDate": voucherDate,
//         "voucherId": voucherId,
//       };
// }
//////////////////////////////////////////////////////2222222222222222222222/////////////////////////////
///
// class SaveSalesInvoice {
//    List<AditionCostColl>? aditionalCostColl=[];
//   List<ItemAllocationColl?> itemAllocationColl;
//   String? manualVoucherNO;
//   String? narration;
//   int? partyLedgerId;
//   String? refNo;
//   double? totalAmount;
//   String? voucherDate;
//   int? voucherId;

//   SaveSalesInvoice(
//       {
//          this.aditionalCostColl,
//       required this.itemAllocationColl,
//       required this.manualVoucherNO,
//       required this.narration,
//       required this.partyLedgerId,
//       required this.refNo,
//       required this.totalAmount,
//       required this.voucherDate,
//       required this.voucherId});

//   SaveSalesInvoice.fromJson(Map<String, dynamic> json) {
//     if (json['aditionalCostColl'] != null) {
//       aditionalCostColl = <void>[];
//       json['aditionalCostColl'].forEach((v) {
//         aditionalCostColl!.add(Null.fromJson(v));
//       });
//     }
//     if (json['itemAllocationColl'] != null) {
//       itemAllocationColl = <ItemAllocationColl>[];
//       json['itemAllocationColl'].forEach((v) {
//         itemAllocationColl.add(ItemAllocationColl.fromJson(v));
//       });
//     }
//     manualVoucherNO = json['manualVoucherNO'];
//     narration = json['narration'];
//     partyLedgerId = json['partyLedgerId'];
//     refNo = json['refNo'];
//     totalAmount = json['totalAmount'];
//     voucherDate = json['voucherDate'];
//     voucherId = json['voucherId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     if (this.aditionalCostColl != null) {
//       data['aditionalCostColl'] =
//           this.aditionalCostColl!.map((v) => v.toJson()).toList();
//     }
//     if (this.itemAllocationColl != null) {
//       data['itemAllocationColl'] =
//           this.itemAllocationColl.map((v) => v!.toJson()).toList();
//     }
//     data['manualVoucherNO'] = this.manualVoucherNO;
//     data['narration'] = this.narration;
//     data['partyLedgerId'] = this.partyLedgerId;
//     data['refNo'] = this.refNo;
//     data['totalAmount'] = this.totalAmount;
//     data['voucherDate'] = this.voucherDate;
//     data['voucherId'] = this.voucherId;
//     return data;
//   }
// }

// class ItemAllocationColl {
//   int? actualQty;
//   double? amount;
//   int? billedQty;
//   double? discountAmt;
//   int? discountPer;
//   int? freeQty;
//   int? ledgerId;
//   int? productId;
//   double? rate;
//   int? unitId;

//   ItemAllocationColl(
//       {
//         required this.actualQty,
//       required this.amount,
//       required this.billedQty,
//       required this.discountAmt,
//       required this.discountPer,
//       required this.freeQty,
//       required this.ledgerId,
//       required this.productId,
//       required this.rate,
//       required this.unitId});

//   ItemAllocationColl.fromJson(Map<String, dynamic> json) {
//     actualQty = json['ActualQty'];
//     amount = json['Amount'];
//     billedQty = json['BilledQty'];
//     discountAmt = json['DiscountAmt'];
//     discountPer = json['DiscountPer'];
//     freeQty = json['FreeQty'];
//     ledgerId = json['LedgerId'];
//     productId = json['ProductId'];
//     rate = json['Rate'];
//     unitId = json['UnitId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['ActualQty'] = this.actualQty;
//     data['Amount'] = this.amount;
//     data['BilledQty'] = this.billedQty;
//     data['DiscountAmt'] = this.discountAmt;
//     data['DiscountPer'] = this.discountPer;
//     data['FreeQty'] = this.freeQty;
//     data['LedgerId'] = this.ledgerId;
//     data['ProductId'] = this.productId;
//     data['Rate'] = this.rate;
//     data['UnitId'] = this.unitId;
//     return data;
//   }
// }

import 'dart:convert';
SaveSalesInvoice saveSalesInvoiceFromJson(String str) =>
    SaveSalesInvoice.fromJson(json.decode(str));
String saveSalesInvoiceToJson(SaveSalesInvoice data) =>
    json.encode(data.toJson());
    class SaveSalesInvoice {
  SaveSalesInvoice({
    required this.aditionalCostColl,
    required this.itemAllocationColl,
    required this.manualVoucherNo,
    required this.narration,
    required this.partyLedgerId,
    required this.refNo,
    required this.totalAmount,
    required this.voucherDate,
    required this.voucherId,
  });
List<dynamic> aditionalCostColl;
  List<Map<String, double>> itemAllocationColl;
  String manualVoucherNo;
  String narration;
  int partyLedgerId;
  String refNo;
  double totalAmount;
  String voucherDate;
  int voucherId;
factory SaveSalesInvoice.fromJson(Map<String, dynamic> json) =>
      SaveSalesInvoice(
        aditionalCostColl:
            List<dynamic>.from(json["aditionalCostColl"].map((x) => x)),
        itemAllocationColl: List<Map<String, double>>.from(
            json["itemAllocationColl"].map((x) => Map.from(x)
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())))),
        manualVoucherNo: json["manualVoucherNO"],
        narration: json["narration"],
        partyLedgerId: json["partyLedgerId"],
        refNo: json["refNo"],
        totalAmount: json["totalAmount"].toDouble(),
        voucherDate: json["voucherDate"],
        voucherId: json["voucherId"],
      );
 Map<String, dynamic> toJson() => {
        "aditionalCostColl":
            List<dynamic>.from(aditionalCostColl.map((x) => x)),
        "itemAllocationColl": List<dynamic>.from(itemAllocationColl.map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "manualVoucherNO": manualVoucherNo,
        "narration": narration,
        "partyLedgerId": partyLedgerId,
        "refNo": refNo,
        "totalAmount": totalAmount,
        "voucherDate": voucherDate,
        "voucherId": voucherId,
      };
}