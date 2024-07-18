import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class PrintPreview extends StatelessWidget {
  const PrintPreview({
    super.key,
    required this.doc,
  });
  final FutureOr<Uint8List> doc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: PdfPreview(
          initialPageFormat: PdfPageFormat.roll80,
          canDebug: false,
          useActions: false,
          canChangeOrientation: false,
          allowPrinting: false,
          actions: const [],
          build: (format) async => doc),
    );
  }
}
