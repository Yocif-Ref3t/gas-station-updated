import 'package:flutter/material.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/features/pumps/data/models/pump_model.dart';
import 'package:gas_station_app/features/pumps/presentation/view/widgets/pump_item.dart';
import 'package:popover/popover.dart';

import '../../../data/models/pump_type.dart';

class FloatingMenuButton extends StatelessWidget {
  final PumpModel pump;
  const FloatingMenuButton({super.key, required this.pump});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Icon(Icons.info, color: Colors.white),
      onTap: () => showPopover(
        context: context,
        direction: PopoverDirection.right,
        bodyBuilder: (context) => FloatingMenuItems(
          pump: pump,
        ),
      ),
    );
  }
}

class FloatingMenuItems extends StatelessWidget {
  final PumpModel pump;

  const FloatingMenuItems({super.key, required this.pump});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info),
              SizedBox(width: 10),
              Text("معلومات"),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "النوع : ${readPumpTypes(pump.types)}",
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.rtl,
          ),
          const Divider(),
          Text(
            "الفرع: ${getInvoiceData()?.branch?.name}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  String readPumpTypes(List<PumpType> types) {
    /// 2
    /// 0
    String type = "";
    for (int i = 0; i < types.length; i++) {
      if (i != 0) type += " - ";
      type += types[i].name;
    }
    return type;
  }
}
