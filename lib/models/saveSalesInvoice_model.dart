// import 'dart:convert';

// SaveSalesInvoice saveSalesInvoiceFromJson(String str) =>
//     SaveSalesInvoice.fromJson(json.decode(str));

// String saveSalesInvoiceToJson(SaveSalesInvoice data) =>
//     json.encode(data.toJson());

class SaveSalesInvoice {
  SaveSalesInvoice({
    required this.voucherDate,
    required this.manualVoucherNo,
    required this.voucherId,
    required this.refNo,
    required this.narration,
    required this.partyLedgerId,
    required this.receiptLedgerId,
    required this.paidAmount,
    required this.totalAmount,
    required this.lineItems,
    required this.additionalCosts,
    required this.filePaths,
  });

  String voucherDate;
  String manualVoucherNo;
  int voucherId;
  String refNo;
  String narration;
  int partyLedgerId;
  int? receiptLedgerId;
  double? paidAmount;
  double? totalAmount;
  List<LineItemUi> lineItems;
  List<AdditinalCost> additionalCosts;
  List<String> filePaths;

  factory SaveSalesInvoice.fromJson(Map<String, dynamic> json) =>
      SaveSalesInvoice(
        voucherDate: json["voucherDate"],
        manualVoucherNo: json["manualVoucherNo"],
        voucherId: json["voucherId"],
        refNo: json["refNo"],
        narration: json["narration"],
        partyLedgerId: json["partyLedgerId"],
        receiptLedgerId: json["receiptLedgerId"],
        paidAmount: json["paidAmount"].toDouble(),
        totalAmount: json["totalAmount"].toDouble(),
        lineItems: List<LineItemUi>.from(json["lineItems"].map((x) => x)),
        additionalCosts:
            List<AdditinalCost>.from(json["additionalCosts"].map((x) => x)),
        filePaths: List<String>.from(json["filePaths"].map((x) => x)),
      );
  Map<String, dynamic> toJson() => {
        "voucherDate": voucherDate,
        "manualVoucherNo": manualVoucherNo,
        "voucherId": voucherId,
        "refNo": refNo,
        "narration": narration,
        "partyLedgerId": partyLedgerId,
        "receiptLedgerId": receiptLedgerId,
        "paidAmount": paidAmount,
        "totalAmount": totalAmount,
        "lineItems": List<LineItemUi>.from(lineItems.map((x) => x)),
        "additionalCosts":
            List<AdditinalCost>.from(additionalCosts.map((x) => x)),
        "filePaths": List<String>.from(filePaths.map((x) => x)),
      };
}

class AdditinalCost {}

class LineItemUi {}
