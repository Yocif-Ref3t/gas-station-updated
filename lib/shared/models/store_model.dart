import 'package:hive/hive.dart';
part "store_model.g.dart" ;
@HiveType(typeId: 3)
class StoreModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? id;

  StoreModel({this.name, this.id});

  StoreModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }
}
