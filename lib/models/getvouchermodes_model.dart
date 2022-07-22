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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['VoucherId'] = voucherId;
    data['VoucherName'] = voucherName;
    data['VoucherType'] = voucherType;
    data['Abbreviation'] = abbreviation;
    data['ResponseMSG'] = responseMSG;
    data['IsSuccess'] = isSuccess;
    return data;
  }
}
