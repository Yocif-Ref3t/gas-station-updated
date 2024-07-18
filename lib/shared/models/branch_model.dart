import 'package:hive/hive.dart';

part 'branch_model.g.dart';

@HiveType(typeId: 2)
class BranchModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? id;
  BranchModel({this.name, this.id});
  BranchModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }
}
