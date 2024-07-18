import 'package:hive/hive.dart';

import '../../features/pumps/data/models/pump_model.dart';
import 'branch_model.dart';
import 'store_model.dart';
part 'invoice_data_model.g.dart';

@HiveType(typeId: 5)
class InvoiceDataModel extends HiveObject {
  @HiveField(0)
  BranchModel? branch;
  @HiveField(1)
  StoreModel? store;
  @HiveField(2)
  PumpModel? pump;

  InvoiceDataModel({this.branch, this.store, this.pump});
}
