import 'dart:convert';

class GetVoucherNo {
  GetVoucherNo({
    required this.autoVoucherNo,
    required this.autoManualNo,
    required this.responseMsg,
    required this.isSuccess,
  });

  int autoVoucherNo;
  String autoManualNo;
  String responseMsg;
  bool isSuccess;

  factory GetVoucherNo.fromJson(String str) =>
      GetVoucherNo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetVoucherNo.fromMap(Map<String, dynamic> json) => GetVoucherNo(
        autoVoucherNo: json["AutoVoucherNo"],
        autoManualNo: json["AutoManualNo"],
        responseMsg: json["ResponseMSG"],
        isSuccess: json["IsSuccess"],
      );

  Map<String, dynamic> toMap() => {
        "AutoVoucherNo": autoVoucherNo,
        "AutoManualNo": autoManualNo,
        "ResponseMSG": responseMsg,
        "IsSuccess": isSuccess,
      };
}

class GetVoucherNoToJSON {
  int constClassId;
  String voucherDate;
  int voucherId;

  GetVoucherNoToJSON(
    this.constClassId,
    this.voucherDate,
    this.voucherId,
  );

  Map toJson() => {
        "constClassId": constClassId,
        "voucherDate": voucherDate,
        "voucherId": voucherId
      };
}
