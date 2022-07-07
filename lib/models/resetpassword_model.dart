class User {
  String old;
  String newPassword;
  User(
    this.old,
    this.newPassword,
  );
  Map toJson() => {
        'oldPwd': old,
        'newPwd': newPassword,
      };
}
