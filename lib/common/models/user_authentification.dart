import 'dart:convert';

class UserAuthentification {
  String userName;
  String passWord;

  UserAuthentification(this.userName, this.passWord);

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'passWord': passWord,
    };
  }

  factory UserAuthentification.fromMap(Map<String, dynamic> map) {
    return UserAuthentification(
      map['userName'] ?? '',
      map['passWord'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAuthentification.fromJson(String source) =>
      UserAuthentification.fromMap(json.decode(source));
}
