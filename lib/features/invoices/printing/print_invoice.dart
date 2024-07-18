import 'dart:ui';
import 'package:flutter/material.dart' as f;
import 'package:flutter/services.dart';
import 'package:gas_station_app/core/app_utils/regex.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';
import 'package:gas_station_app/shared/models/invoice_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoicePdf {
  static Future<Uint8List> generateInvoicePdf(
      {required InvoiceModel invoice}) async {
    // fonts
    final byteData = await rootBundle.load("assets/fonts/bahjiibold.ttf");
    final regbyteData = await rootBundle.load("assets/fonts/bahjiiregular.ttf");
    final logoImg = await flutterImageProvider(
        const f.AssetImage("assets/images/elcaptin_main_logo.png"));
    String paymentType = invoice.paymentType == 1 ? "أجل" : "نقدي";
    getValueAddedTax() {
      num taxExtraPrct = getUser()?.taxExtraPrct ?? 0.0;
      num totalSale = invoice.product?.totSal ?? 0.0;

      return totalSale * (taxExtraPrct / 100.0);
    }

    getTotalValueAfterTax() {
      num totalSale = invoice.product?.totSal ?? 0.0;
      num tips = invoice.tips ?? 0.0;

      return totalSale + getValueAddedTax() + tips;
    }

    final doc = pw.Document();

    doc.addPage(pw.Page(
        textDirection: pw.TextDirection.rtl,
        pageFormat: PdfPageFormat.roll80,
        theme: pw.ThemeData.withFont(
            base: pw.Font.ttf(regbyteData), bold: pw.Font.ttf(byteData)),
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.SizedBox(
              width: double.infinity,
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(10.0),
              child: pw.Image(logoImg, width: 100, height: 100.0),
            ),
            pw.Text(getUser()?.name ?? "محطة الكابتن",
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pdfSmallText(
              "الرقم الضريبي : ${getUser()?.taxNo}",
            ),
            pdfSmallText(
              "ضريبة القيمة المضافة :  ${getUser()?.taxExtraPrct}" " %",
            ),
            pdfSmallText(
              "سجل تجارى : ${getUser()?.cRNo}",
            ),
            pdfSmallText(
              "فاتورة ضريبة : $paymentType  رقم : ${invoice.invoiceNo}",
            ),
            pdfSmallText(
              "تاريخ الاصدار : ${invoice.invDate}",
            ),
            pw.SizedBox(height: 20.0),
            pdfRowText("اسم العميل : ", invoice.customerName ?? "---"),
            pdfRowText("رقم العميل : ", invoice.customerId.toString()),
            pdfRowText("المندوب : ", getUser()?.username ?? "---"),
            pw.SizedBox(height: 20.0),
            pw.Table(
                border:
                    pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.TableRow(children: [
                    pdfSmallText(" إجمالي بعد الضريبة ", txtValue: 6.0),
                    pdfSmallText(" إجمالي قبل الضريبة ", txtValue: 6.0),
                    pdfSmallText(" الكمية ", txtValue: 6.0),
                    pdfSmallText(" سعر الوحدة ", txtValue: 6.0),
                    pdfSmallText(" الصنف ", txtValue: 6.0),
                  ]),
                  pw.TableRow(
                      decoration:
                          const pw.BoxDecoration(color: PdfColors.grey100),
                      children: [
                        pdfSmallText("0000", txtValue: 6.0),
                        pdfSmallText(
                            invoice.product?.totSal.toString() ?? '---',
                            txtValue: 6.0),
                        pdfSmallText(invoice.product?.qty.toString() ?? "---",
                            txtValue: 6.0),
                        pdfSmallText(
                            invoice.product?.itmSal.toString() ?? "---",
                            txtValue: 6.0),
                        pw.Expanded(
                            child: pdfSmallText(
                                invoice.product?.itemName.toString() ?? "---",
                                txtValue: 6.0))
                        // )
                      ]),
                ]),
            pw.SizedBox(height: 20.0),
            pw.Table(
                border:
                    pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.TableRow(
                      decoration:
                          const pw.BoxDecoration(color: PdfColors.grey100),
                      children: [
                        pdfSmallText(
                            invoice.product?.totSal.toString() ?? "---",
                            txtValue: 6.0),
                        pdfSmallText(" إجمالي قبل الضريبة ",
                            txtValue: 6.0, textAlign: pw.TextAlign.end),
                      ]),
                  pw.TableRow(children: [
                    pdfSmallText(invoice.product?.totSal.toString() ?? "---",
                        txtValue: 6.0),
                    pdfSmallText(" صافي قبل الضريبة ",
                        txtValue: 6.0, textAlign: pw.TextAlign.end),
                  ]),
                  pw.TableRow(
                      decoration:
                          const pw.BoxDecoration(color: PdfColors.grey100),
                      children: [
                        pdfSmallText(getValueAddedTax().toString(),
                            txtValue: 6.0),
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.SizedBox(
                                width: 20.0,
                              ),
                              pdfSmallText("${getUser()?.taxExtraPrct} %",
                                  txtValue: 6.0),
                              pw.SizedBox(
                                width: 50.0,
                              ),
                              pdfSmallText("ضريبة القيمة المضافة",
                                  txtValue: 6.0),
                            ])
                      ]),
                  pw.TableRow(
                      decoration:
                          const pw.BoxDecoration(color: PdfColors.grey100),
                      children: [
                        pdfSmallText(invoice.tips.toString(), txtValue: 6.0),
                        pdfSmallText("اكراميات",
                            txtValue: 6.0, textAlign: pw.TextAlign.end),
                      ]),
                  pw.TableRow(children: [
                    pdfSmallText("${getTotalValueAfterTax()}", txtValue: 6.0),
                    pdfSmallText("إجمالي بعد الضريبة",
                        txtValue: 6.0, textAlign: pw.TextAlign.end),
                  ]),
                ]),
            pw.SizedBox(height: 10.0),
            pdfSmallText(getInvoiceData()!.store!.name ?? '---'),
            pw.Padding(
              padding: const pw.EdgeInsets.all(10.0),
              child: pw.BarcodeWidget(
                  color: PdfColor.fromHex("#000000"),
                  barcode: pw.Barcode.qrCode(),
                  data: invoice.invoiceNo.toString(),
                  width: 100,
                  height: 50),
            ),
            pw.SizedBox(height: 10.0),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pdfSmallText("توقيع العميل"),
                  pw.Expanded(
                      child: pdfSmallText("توقيع  المندوب",
                          textAlign: pw.TextAlign.end))
                ]),
            pw.SizedBox(height: 10.0),
          ]);
        }));
    return doc.save();
  }

  static pdfSmallText(String txt, {double? txtValue, pw.TextAlign? textAlign}) {
    return pw.Text(txt,
        textAlign: textAlign ?? pw.TextAlign.center,
        style: pw.TextStyle(
          fontSize: txtValue ?? 10.0,
        ));
  }

  static pdfRowText(String txt, String value, {pw.TextAlign? textAlign}) {
    return pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pdfSmallText(txt),
          pw.Expanded(child: pdfSmallText(value, textAlign: textAlign))
          //  )
        ]);
  }

  static print({required InvoiceModel invoice}) {
    Printing.layoutPdf(
        onLayout: (PdfPageFormat formate) async =>
            await generateInvoicePdf(invoice: invoice));
  }

  static sharePdf({required InvoiceModel invoice}) async {
    await Printing.sharePdf(
        bytes: await generateInvoicePdf(invoice: invoice),
        filename: 'invoiceINFOSAS.pdf');
  }
}

extension ColorExtension on f.Color {
  PdfColor get pdfColor => PdfColor(
      red.toDouble() / 255, green.toDouble() / 255, blue.toDouble() / 255);
}




// trying

// class InvoicePdf {

//   static String htmlContent = '''
//     <html>
//       <body>
//         <h1>Hello, World!</h1>
//         <p>This is an example HTML content.</p>
//       </body>
//     </html>
//   ''';

//   static Future<Uint8List>  generateInvoicePdf( List<pw.Widget> p) async{
//     final doc = Document();
//         final bronH = await rootBundle.load("assets/fonts/Cairo-Black.ttf");

//     doc.addPage(MultiPage(
//         // pageFormat: PdfPageFormat.roll80 ,
//            maxPages: 1,
//           pageTheme:  pw.PageTheme(
//             // pageFormat: PdfPageFormat.roll80 ,
//             textDirection: TextDirection.ltr ,
//             theme: pw.ThemeData.withFont(
//             base: Font.ttf(bronH), bold: Font.ttf(bronH)),

//           ),
//         build: (  context) {
//           return  p ;
//         }));
//     // doc.addPage(createInvoicePage(p));
//     return doc.save();
//   }

//   // static createInvoicePage( List<Widget> p) {
//   //   return Page(build: (Context context) {
//   //     return   ;
//   //   });
//   // }

//   static print(String html) async {
//     // var doc = parse (html) ;
//     final  widgets = await HTMLToPdf().convert(html);

//     // final result =
//     //      await Printing.convertHtml(html: html, format: PdfPageFormat.a4);
//     //  await Printing.sharePdf(bytes: await generateInvoicePdf(widgets) );

//     //  final formatedString = formatHtmlToRole80(html);

//     Printing.layoutPdf(
//         onLayout: (PdfPageFormat formate) async =>
//              Printing.convertHtml(html: html, format: formate )

//         //  generateInvoicePdf(widgets )  ,format: PdfPageFormat.roll80
//         );
//   }

//   static String formatHtmlToRole80(String htmlContent) {
//     // Remove any existing line breaks or whitespace
//     final trimmedHtml = htmlContent.replaceAll(RegExp(r'\r?\n|\s'), '');

//     // Insert line breaks every 80 characters
//     final formattedHtml = trimmedHtml.replaceAllMapped(
//       RegExp('.{1,80}'),
//       (match) => '${match.group(0)}\n',
//     );

//     return formattedHtml;
//   }
// }
