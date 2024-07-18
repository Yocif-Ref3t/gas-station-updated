import '../../features/pumps/data/models/pump_type.dart';

List<PumpType> getPumpTypes(json) {
  List<PumpType> types = [];
  if (json['PumpCountr1_95'] != null) {
    types.add(PumpType(name: "بنزين 95"));
  }
  if (json['PumpCountr2_92'] != null) {
    types.add(PumpType(name: "بنزين 92"));
  }
  if (json['PumpCountr3_80'] != null) {
    types.add(PumpType(name: "بنزين 80"));
  }
  return types;
}
