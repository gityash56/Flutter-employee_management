import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  DateTime? createdAt;
  String name;
  String? avatar;
  String emailId;
  String mobile;
  String country;
  String? state;
  String? district;
  String id;
  String? email;

  UserModel({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.emailId,
    required this.mobile,
    required this.country,
    required this.state,
    required this.district,
    required this.id,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        emailId: json["emailId"],
        mobile: json["mobile"],
        country: json["country"],
        state: json["state"],
        district: json["district"],
        id: json["id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "emailId": emailId,
        "mobile": mobile,
        "country": country,
        "state": state,
        "district": district,
        "id": id,
        "email": email,
      };
}
