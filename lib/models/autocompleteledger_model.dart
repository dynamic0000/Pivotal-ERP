import 'dart:developer';

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

class AutoCompleteLedgerListToJSON {
  int searchBy;
  String searchValue;
  int ledgerType;

  AutoCompleteLedgerListToJSON(
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
