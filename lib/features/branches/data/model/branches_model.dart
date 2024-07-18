import 'package:gas_station_app/shared/models/branch_model.dart';

class AllBranchesModel {
  List<BranchModel>? branchesList = <BranchModel>[];

  AllBranchesModel({this.branchesList});

  AllBranchesModel.fromJson(List json) {
    if (json.isNotEmpty) {
      for (var element in json) {
        branchesList?.add(BranchModel.fromJson(element));
      }
    }
  }
}

// class Branche {
//   String? name;
//   int? id;

//   Branche({this.name, this.id});

//   Branche.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     id = json['id'];
//   }
// }
