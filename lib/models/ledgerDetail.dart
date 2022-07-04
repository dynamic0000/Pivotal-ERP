class ledgerDetail {
  int? ledgerId;
  int? groupId;
  String? name;
  String? alias;
  String? code;
  String? groupName;
  String? agent;
  double? creditLimitAmt;
  double? creditLimitDays;
  String? area;
  String? address;
  String? debtorType;
  String? debtorRoute;
  String? panVat;
  String? mobileNo1;
  String? mobileNo2;
  String? emailId;
  double? opening;
  double? drAmt;
  double? crAmt;
  double? closing;
  double? tranAmt;

  void lastTranDateAD;
  String? lastTranDateBS;
  double? bGAmt;
  double? pDCAmt;
  double? oDCAmt;
  bool? costCentersAreApplied;
  bool? billWiseAdjustment;
  bool? isTDS;
  bool? isVat;
  bool? activeChequeDetails;
  bool? blockDebitTransaction;
  bool? blockCreditTransaction;
  bool? inventoryValuesAreAffected;
  double? rate;
  int? ledgerType;
  String? responseMSG;
  bool? isSuccess;
  int? rId;
  int? cUserId;
  void responseId;
  int? entityId;
  int? errorNumber;

  ledgerDetail(
      {this.ledgerId,
      this.groupId,
      this.name,
      this.alias,
      this.code,
      this.groupName,
      this.agent,
      this.creditLimitAmt,
      this.creditLimitDays,
      this.area,
      this.address,
      this.debtorType,
      this.debtorRoute,
      this.panVat,
      this.mobileNo1,
      this.mobileNo2,
      this.emailId,
      this.opening,
      this.drAmt,
      this.crAmt,
      this.closing,
      this.tranAmt,
      this.lastTranDateAD,
      this.lastTranDateBS,
      this.bGAmt,
      this.pDCAmt,
      this.oDCAmt,
      this.costCentersAreApplied,
      this.billWiseAdjustment,
      this.isTDS,
      this.isVat,
      this.activeChequeDetails,
      this.blockDebitTransaction,
      this.blockCreditTransaction,
      this.inventoryValuesAreAffected,
      this.rate,
      this.ledgerType,
      this.responseMSG,
      this.isSuccess,
      this.rId,
      this.cUserId,
      this.responseId,
      this.entityId,
      this.errorNumber});

  ledgerDetail.fromJson(Map<String, dynamic> json) {
    ledgerId = json['LedgerId'];
    groupId = json['GroupId'];
    name = json['Name'];
    alias = json['Alias'];
    code = json['Code'];
    groupName = json['GroupName'];
    agent = json['Agent'];
    creditLimitAmt = json['CreditLimitAmt'];
    creditLimitDays = json['CreditLimitDays'];
    area = json['Area'];
    address = json['Address'];
    debtorType = json['DebtorType'];
    debtorRoute = json['DebtorRoute'];
    panVat = json['PanVat'];
    mobileNo1 = json['MobileNo1'];
    mobileNo2 = json['MobileNo2'];
    emailId = json['EmailId'];
    opening = json['Opening'];
    drAmt = json['DrAmt'];
    crAmt = json['CrAmt'];
    closing = json['Closing'];
    tranAmt = json['TranAmt'];
    lastTranDateAD = json['LastTranDateAD'];
    lastTranDateBS = json['LastTranDateBS'];
    bGAmt = json['BGAmt'];
    pDCAmt = json['PDCAmt'];
    oDCAmt = json['ODCAmt'];
    costCentersAreApplied = json['CostCentersAreApplied'];
    billWiseAdjustment = json['BillWiseAdjustment'];
    isTDS = json['IsTDS'];
    isVat = json['IsVat'];
    activeChequeDetails = json['ActiveChequeDetails'];
    blockDebitTransaction = json['BlockDebitTransaction'];
    blockCreditTransaction = json['BlockCreditTransaction'];
    inventoryValuesAreAffected = json['InventoryValuesAreAffected'];
    rate = json['Rate'];
    ledgerType = json['LedgerType'];
    responseMSG = json['ResponseMSG'];
    isSuccess = json['IsSuccess'];
    rId = json['RId'];
    cUserId = json['CUserId'];
    responseId = json['ResponseId'];
    entityId = json['EntityId'];
    errorNumber = json['ErrorNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LedgerId'] = ledgerId;
    data['GroupId'] = groupId;
    data['Name'] = name;
    data['Alias'] = alias;
    data['Code'] = code;
    data['GroupName'] = groupName;
    data['Agent'] = agent;
    data['CreditLimitAmt'] = creditLimitAmt;
    data['CreditLimitDays'] = creditLimitDays;
    data['Area'] = area;
    data['Address'] = address;
    data['DebtorType'] = debtorType;
    data['DebtorRoute'] = debtorRoute;
    data['PanVat'] = panVat;
    data['MobileNo1'] = mobileNo1;
    data['MobileNo2'] = mobileNo2;
    data['EmailId'] = emailId;
    data['Opening'] = opening;
    data['DrAmt'] = drAmt;
    data['CrAmt'] = crAmt;
    data['Closing'] = closing;
    data['TranAmt'] = tranAmt;
    data['LastTranDateAD'] = null;
    data['LastTranDateBS'] = lastTranDateBS;
    data['BGAmt'] = bGAmt;
    data['PDCAmt'] = pDCAmt;
    data['ODCAmt'] = oDCAmt;
    data['CostCentersAreApplied'] = costCentersAreApplied;
    data['BillWiseAdjustment'] = billWiseAdjustment;
    data['IsTDS'] = isTDS;
    data['IsVat'] = isVat;
    data['ActiveChequeDetails'] = activeChequeDetails;
    data['BlockDebitTransaction'] = blockDebitTransaction;
    data['BlockCreditTransaction'] = blockCreditTransaction;
    data['InventoryValuesAreAffected'] = inventoryValuesAreAffected;
    data['Rate'] = rate;
    data['LedgerType'] = ledgerType;
    data['ResponseMSG'] = responseMSG;
    data['IsSuccess'] = isSuccess;
    data['RId'] = rId;
    data['CUserId'] = cUserId;
    data['ResponseId'] = null;
    data['EntityId'] = entityId;
    data['ErrorNumber'] = errorNumber;
    return data;
  }
}

class GetLedgerToJson {
  int ledgerId;
  GetLedgerToJson(this.ledgerId);

  Map toJson() => {'ledgerId': ledgerId};
}
