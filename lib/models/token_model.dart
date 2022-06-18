class TokenModel {
  TokenModel({
    required this.access_Token,
  });

  final String access_Token;

  factory TokenModel.fromMap(Map<String, dynamic> json) => TokenModel(
        access_Token: json["access_token"],
      );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    return result;
  }

  Map<String, dynamic> toJson() => {
        "access_token": access_Token,
      };
}
