import 'dart:convert';

List<AutoCompleteProductList> autoCompleteProductListFromJson(String str) =>
    List<AutoCompleteProductList>.from(
        json.decode(str).map((x) => AutoCompleteProductList.fromJson(x)));

String autoCompleteProductListToJson(List<AutoCompleteProductList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AutoCompleteProductList {
  AutoCompleteProductList({
    required this.productId,
    required this.productGroupId,
    required this.name,
    required this.alias,
    required this.code,
    required this.productGroup,
    required this.unitId,
    required this.unit,
    required this.partNo,
  });

  int productId;
  int productGroupId;
  String name;
  String alias;
  String code;
  String productGroup;
  int unitId;
  String unit;
  String partNo;

  factory AutoCompleteProductList.fromJson(Map<String, dynamic> json) =>
      AutoCompleteProductList(
        productId: json["ProductId"],
        productGroupId: json["ProductGroupId"],
        name: json["Name"],
        alias: json["Alias"],
        code: json["Code"],
        productGroup: json["ProductGroup"],
        unitId: json["UnitId"],
        unit: json["Unit"],
        partNo: json["PartNo"],
      );

  // Map<String, dynamic> toJson() => {
  //     "ProductId": productId,
  //     "ProductGroupId": productGroupId,
  //     "Name": name,
  //     "Alias": alias,
  //     "Code": code,
  //     "ProductGroup": productGroup,
  //     "UnitId": unitId,
  //     "Unit": unit,
  //     "PartNo": partNo,
  // };
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data9 = <String, dynamic>{};
    data9['ProductId'] = productId;
    data9["ProductGroupId"] = productGroupId;
    data9["Name"] = name;
    data9["Alias"] = alias;
    data9["Code"] = code;
    data9["ProductGroup"] = productGroup;
    data9["UnitId"] = unitId;
    data9["Unit"] = unit;
    data9["PartNo"] = partNo;
    return data9;
  }
}

class AutoCompleteProductListToJSON {
  int searchBy;
  String searchValue;
  int ledgerType;

  AutoCompleteProductListToJSON(
    this.searchBy,
    this.searchValue,
    this.ledgerType,
  );

  Map toJson() => {
        'searchBy': searchBy,
        'searchValue': searchValue,
        'ledgerType': ledgerType
      };
}
