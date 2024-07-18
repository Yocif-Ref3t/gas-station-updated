import 'package:hive/hive.dart';

part 'pump_type.g.dart';

@HiveType(typeId: 7)
class PumpType {
  @HiveField(0)
  final String name;
  PumpType({required this.name});
}
