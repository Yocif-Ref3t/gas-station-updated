import 'package:hive/hive.dart';

import 'pump_type.dart';
part 'pump_model.g.dart';

@HiveType(typeId: 6)
class PumpModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String compId;
  @HiveField(2)
  final String branchNo;
  @HiveField(3)
  final String pumpNo;
  @HiveField(4)
  final String pumpName;
  @HiveField(5)
  final List<PumpType> types;
  PumpModel({
    required this.id,
    required this.compId,
    required this.branchNo,
    required this.pumpNo,
    required this.pumpName,
    required this.types,
  });

  factory PumpModel.fromJson(json, {required List<PumpType> types}) {
    return PumpModel(
      id: json['ID_No'].toString(),
      compId: json['Cmp_No'].toString(),
      branchNo: json['Brn_No'].toString(),
      pumpNo: json['Pump_No'].toString(),
      pumpName: json['Pump_NmAr'].toString(),
      types: types,
    );
  }
}
