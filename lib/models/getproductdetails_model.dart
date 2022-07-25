// To parse required this JSON data, do
//
//     final getProductDetails = getProductDetailsFromMap(jsonString);

import 'dart:convert';

class GetProductDetails {
  GetProductDetails({
    this.productId,
    this.productGroupId,
    this.name,
    this.alias,
    this.code,
    this.productGroup,
    this.productCategories,
    this.productType,
    this.baseUnitId,
    this.baseUnit,
    this.productBrand,
    this.partNo,
    this.remarks,
    this.salesLedger,
    this.salesLedgerId,
    this.purchaseLedger,
    this.purchaseLedgerId,
    this.openingQty,
    this.inQty,
    this.outQty,
    this.closingQty,
    this.tranQty,
    this.lastTranDateAd,
    this.lastTranDateBs,
    this.purchaseRate,
    this.purchaseRateApplicableFromAd,
    this.purchaseRateApplicableFromBs,
    this.salesRate,
    this.salesRateApplicableFromAd,
    this.salesRateApplicableFromBs,
    this.rack,
    this.canEditRate,
    this.canEditRatePurchase,
    this.vatRate,
    this.ignoreNegativeBalance,
    this.maintainBatchWise,
    this.useMfgDate,
    this.useExpDate,
    this.isFixedProduct,
    this.exDutyRate,
    this.includingVat,
    this.purchaseCcRate,
    this.salesCcRate,
    this.exDutyUnitId,
    this.tscRate,
    this.isTaxable,
    this.alternetUnitColl,
    this.responseMsg,
    this.isSuccess,
    this.rId,
    this.cUserId,
    this.responseId,
    this.entityId,
    this.errorNumber,
  });

  int? productId;
  int? productGroupId;
  String? name;
  String? alias;
  String? code;
  String? productGroup;
  String? productCategories;
  String? productType;
  int? baseUnitId;
  String? baseUnit;
  String? productBrand;
  String? partNo;
  String? remarks;
  String? salesLedger;
  int? salesLedgerId;
  String? purchaseLedger;
  int? purchaseLedgerId;
  double? openingQty;
  double? inQty;
  double? outQty;
  double? closingQty;
  double? tranQty;
  dynamic lastTranDateAd;
  String? lastTranDateBs;
  double? purchaseRate;
  DateTime? purchaseRateApplicableFromAd;
  String? purchaseRateApplicableFromBs;
  double? salesRate;
  DateTime? salesRateApplicableFromAd;
  String? salesRateApplicableFromBs;
  String? rack;
  bool? canEditRate;
  bool? canEditRatePurchase;
  double? vatRate;
  bool? ignoreNegativeBalance;
  bool? maintainBatchWise;
  bool? useMfgDate;
  bool? useExpDate;
  bool? isFixedProduct;
  double? exDutyRate;
  bool? includingVat;
  double? purchaseCcRate;
  double? salesCcRate;
  dynamic exDutyUnitId;
  double? tscRate;
  bool? isTaxable;
  List<dynamic>? alternetUnitColl;
  String? responseMsg;
  bool? isSuccess;
  int? rId;
  int? cUserId;
  String? responseId;
  int? entityId;
  int? errorNumber;

  factory GetProductDetails.fromJson(String str) =>
      GetProductDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetProductDetails.fromMap(Map<String, dynamic> json) =>
      GetProductDetails(
        productId: json["ProductId"],
        productGroupId: json["ProductGroupId"],
        name: json["Name"],
        alias: json["Alias"],
        code: json["Code"],
        productGroup: json["ProductGroup"],
        productCategories: json["ProductCategories"],
        productType: json["ProductType"],
        baseUnitId: json["BaseUnitId"],
        baseUnit: json["BaseUnit"],
        productBrand: json["ProductBrand"],
        partNo: json["PartNo"],
        remarks: json["Remarks"],
        salesLedger: json["SalesLedger"],
        salesLedgerId: json["SalesLedgerId"],
        purchaseLedger: json["PurchaseLedger"],
        purchaseLedgerId: json["PurchaseLedgerId"],
        openingQty: json["OpeningQty"],
        inQty: json["InQty"],
        outQty: json["OutQty"].toDouble(),
        closingQty: json["ClosingQty"].toDouble(),
        tranQty: json["TranQty"],
        lastTranDateAd: json["LastTranDateAD"],
        lastTranDateBs: json["LastTranDateBS"],
        purchaseRate: json["PurchaseRate"].toDouble(),
        purchaseRateApplicableFromAd:
            DateTime.parse(json["PurchaseRateApplicableFromAD"]),
        purchaseRateApplicableFromBs: json["PurchaseRateApplicableFromBS"],
        salesRate: json["SalesRate"].toDouble(),
        salesRateApplicableFromAd:
            DateTime.parse(json["SalesRateApplicableFromAD"]),
        salesRateApplicableFromBs: json["SalesRateApplicableFromBS"],
        rack: json["Rack"],
        canEditRate: json["CanEditRate"],
        canEditRatePurchase: json["CanEditRatePurchase"],
        vatRate: json["VatRate"],
        ignoreNegativeBalance: json["IgnoreNegativeBalance"],
        maintainBatchWise: json["MaintainBatchWise"],
        useMfgDate: json["UseMfgDate"],
        useExpDate: json["UseExpDate"],
        isFixedProduct: json["IsFixedProduct"],
        exDutyRate: json["EXDutyRate"],
        includingVat: json["IncludingVat"],
        purchaseCcRate: json["PurchaseCCRate"],
        salesCcRate: json["SalesCCRate"],
        exDutyUnitId: json["ExDutyUnitId"],
        tscRate: json["TSCRate"],
        isTaxable: json["IsTaxable"],
        alternetUnitColl:
            List<dynamic>.from(json["AlternetUnitColl"].map((x) => x)),
        responseMsg: json["ResponseMSG"],
        isSuccess: json["IsSuccess"],
        rId: json["RId"],
        cUserId: json["CUserId"],
        responseId: json["ResponseId"],
        entityId: json["EntityId"],
        errorNumber: json["ErrorNumber"],
      );

  Map<String, dynamic> toMap() => {
        "ProductId": productId,
        "ProductGroupId": productGroupId,
        "Name": name,
        "Alias": alias,
        "Code": code,
        "ProductGroup": productGroup,
        "ProductCategories": productCategories,
        "ProductType": productType,
        "BaseUnitId": baseUnitId,
        "BaseUnit": baseUnit,
        "ProductBrand": productBrand,
        "PartNo": partNo,
        "Remarks": remarks,
        "SalesLedger": salesLedger,
        "SalesLedgerId": salesLedgerId,
        "PurchaseLedger": purchaseLedger,
        "PurchaseLedgerId": purchaseLedgerId,
        "OpeningQty": openingQty,
        "InQty": inQty,
        "OutQty": outQty,
        "ClosingQty": closingQty,
        "TranQty": tranQty,
        "LastTranDateAD": lastTranDateAd,
        "LastTranDateBS": lastTranDateBs,
        "PurchaseRate": purchaseRate,
        "PurchaseRateApplicableFromAD":
            purchaseRateApplicableFromAd!.toIso8601String(),
        "PurchaseRateApplicableFromBS": purchaseRateApplicableFromBs,
        "SalesRate": salesRate,
        "SalesRateApplicableFromAD":
            salesRateApplicableFromAd!.toIso8601String(),
        "SalesRateApplicableFromBS": salesRateApplicableFromBs,
        "Rack": rack,
        "CanEditRate": canEditRate,
        "CanEditRatePurchase": canEditRatePurchase,
        "VatRate": vatRate,
        "IgnoreNegativeBalance": ignoreNegativeBalance,
        "MaintainBatchWise": maintainBatchWise,
        "UseMfgDate": useMfgDate,
        "UseExpDate": useExpDate,
        "IsFixedProduct": isFixedProduct,
        "EXDutyRate": exDutyRate,
        "IncludingVat": includingVat,
        "PurchaseCCRate": purchaseCcRate,
        "SalesCCRate": salesCcRate,
        "ExDutyUnitId": exDutyUnitId,
        "TSCRate": tscRate,
        "IsTaxable": isTaxable,
        "AlternetUnitColl": List<dynamic>.from(alternetUnitColl!.map((x) => x)),
        "ResponseMSG": responseMsg,
        "IsSuccess": isSuccess,
        "RId": rId,
        "CUserId": cUserId,
        "ResponseId": responseId,
        "EntityId": entityId,
        "ErrorNumber": errorNumber,
      };
}

class GetProductDetialsToJSON {
  int productId;

  GetProductDetialsToJSON(this.productId);

  Map toJson() => {
        'productId': productId,
      };
}
