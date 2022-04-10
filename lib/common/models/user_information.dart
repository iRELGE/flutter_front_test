import 'dart:convert';

class UserInformation {
  final String profileImg;
  final String firstName;
  final String lastName;
  final String speciality;
  final String token;

  UserInformation(this.profileImg, this.firstName, this.lastName,
      this.speciality, this.token);

  Map<String, dynamic> toMap() {
    return {
      'profileImg': profileImg,
      'firstName': firstName,
      'lastName': lastName,
      'speciality': speciality,
      'token': token,
    };
  }

  factory UserInformation.fromMap(Map<String, dynamic> map) {
    return UserInformation(
      map['profileImg'] ?? '',
      map['firstName'] ?? '',
      map['lastName'] ?? '',
      map['speciality'] ?? '',
      map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInformation.fromJson(String source) =>
      UserInformation.fromMap(json.decode(source));
}
