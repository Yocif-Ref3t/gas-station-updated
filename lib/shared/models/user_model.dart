import 'package:hive/hive.dart';

///=====>flutter packages pub run build_runner build
part 'user_model.g.dart';

// @HiveType(typeId: 1)
// class UserModel extends HiveObject {
//   @HiveField(0)
//   final String token;
//   @HiveField(1)
//   final String id;
//   @HiveField(2)
//   final String userName;
//   @HiveField(3)
//   final String email;
//   @HiveField(4)
//   final String role;
//   @HiveField(5)
//   final String compNo;
//   @HiveField(6)
//   final String compId;
//   @HiveField(7)
//   final String name;

//   UserModel({
//     required this.token,
//     required this.id,
//     required this.userName,
//     required this.email,
//     required this.role,
//     required this.compNo,
//     required this.compId,
//     required this.name,
//   });

//   factory UserModel.fromJson(json) {
//     return UserModel(
//       token: json['token'].toString(),
//       id: json['id'].toString(),
//       userName: json['username'].toString(),
//       email: json['email'].toString(),
//       role: json['role'].toString(),
//       compId: json['cmpId'].toString(),
//       compNo: json['cmpNo'].toString(),
//       name: json['name'].toString(),
//     );
//   }
// }
@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String? status;
  @HiveField(1)
  String? message;
  @HiveField(2)
  String? token;
  @HiveField(3)
  String? username;
  @HiveField(4)
  int? id;
  @HiveField(5)
  String? email;
  @HiveField(6)
  String? role;
  @HiveField(7)
  int? cmpId;
  @HiveField(8)
  int? cmpNo;
  @HiveField(9)
  String? name;
  @HiveField(10)
  String? logo;
  @HiveField(11)
  String? taxNo;
  @HiveField(12)
  String? cRNo;
  @HiveField(13)
  int? taxExtraPrct;
  @HiveField(14)
  bool? allowNegative;

  UserModel(
      {this.status,
      this.message,
      this.token,
      this.username,
      this.id,
      this.email,
      this.role,
      this.cmpId,
      this.cmpNo,
      this.name,
      this.logo,
      this.taxNo,
      this.cRNo,
      this.taxExtraPrct,
      this.allowNegative});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    username = json['username'];
    id = json['id'];
    email = json['email'];
    role = json['role'];
    cmpId = json['cmpId'];
    cmpNo = json['cmpNo'];
    name = json['name'];
    logo = json['logo'];
    taxNo = json['Tax_No'];
    cRNo = json['CR_No'];
    taxExtraPrct = json['TaxExtra_Prct'];
    allowNegative = json['allow_negative'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    data['username'] = username;
    data['id'] = id;
    data['email'] = email;
    data['role'] = role;
    data['cmpId'] = cmpId;
    data['cmpNo'] = cmpNo;
    data['name'] = name;
    data['logo'] = logo;
    data['Tax_No'] = taxNo;
    data['CR_No'] = cRNo;
    data['TaxExtra_Prct'] = taxExtraPrct;
    data['allow_negative'] = allowNegative;
    return data;
  }
}
