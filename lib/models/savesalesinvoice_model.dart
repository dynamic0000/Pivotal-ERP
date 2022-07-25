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
