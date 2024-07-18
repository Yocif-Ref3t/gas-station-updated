import 'package:gas_station_app/shared/models/store_model.dart';
import 'package:hive/hive.dart';

class AllStoresModel {
  List<StoreModel>? storeList = <StoreModel>[];

  AllStoresModel({this.storeList});

  AllStoresModel.fromJson(List json) {
    if (json.isNotEmpty) {
      for (var element in json) {
        storeList?.add(StoreModel.fromJson(element));
      }
    }
  }
}
 
