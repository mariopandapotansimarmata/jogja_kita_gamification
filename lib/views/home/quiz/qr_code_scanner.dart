import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jogja_kita_gamification/view_model/order_view_model.dart';
import 'package:jogja_kita_gamification/views/order/active_order/active_order.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scan/scan.dart';

import '../../../view_model/quiz_view_model.dart';
import 'quiz.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final ImagePicker _picker = ImagePicker();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () =>
                Navigator.of(context).pop((route) => route.isFirst)),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                result != null
                    ? Text('${result!.code}')
                    : const Text('Scan a code'),
                Container(
                  width: 200,
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[800]),
                    onPressed: _scanFromGallery,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.photo_library,
                          color: Colors.white,
                        ),
                        Text('Scan from Gallery',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width) * 0.7;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      result = scanData;

      await context.read<QuizViewModel>().showQuestionsByQR(result!.code!);
      if (scanData.code != null &&
          scanData.code!.isNotEmpty &&
          await context
                  .read<QuizViewModel>()
                  .isQuestionPackageExist(scanData.code!) ==
              true &&
          await context.read<OrderViewModel>().isActiveOrdersExist() == true) {
        var order = await context.read<OrderViewModel>().showOneActiveOrders();
        order[0].setIsFinish = 1;

        await context
            .read<OrderViewModel>()
            .updateFinishStatusFromQuiz(order[0]);
        scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            backgroundColor: Colors.blue[300],
            content: const Row(
              children: [
                Text('Selamat Anda mendapatkan + 50'),
                Icon(
                  Icons.control_camera_outlined,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        );

        await context.read<QuizViewModel>().showQuestionsByQR(result!.code!);
        await Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return QuizzPage(
            remainingTime: context.read<QuizViewModel>().quizTime,
            indexQuestion: 0,
            listQuiz: context.read<QuizViewModel>().listQuestion,
          );
        }));
      } else {
        setState(() {
          result = Barcode("QR Code tidak ditemukan", BarcodeFormat.qrcode, []);
        });
      }
      // else {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text('No barcode found in the image')),
      //   );
      // }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    print('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  Future<void> _scanFromGallery() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final results = await Scan.parse(image.path);
        print(results);
        if (results != null &&
            results.isNotEmpty &&
            await context
                    .read<QuizViewModel>()
                    .isQuestionPackageExist(results) ==
                true &&
            await context.read<OrderViewModel>().isActiveOrdersExist() ==
                true) {
          var order =
              await context.read<OrderViewModel>().showOneActiveOrders();
          order[0].setIsFinish = 1;
          await context
              .read<OrderViewModel>()
              .updateFinishStatusFromQuiz(order[0]);
          scaffoldMessengerKey.currentState?.showSnackBar(
            SnackBar(
              backgroundColor: Colors.blue[300],
              content: const Row(
                children: [
                  Text('Selamat Anda mendapatkan + 50'),
                  Icon(
                    Icons.control_camera_outlined,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          );
          await context.read<QuizViewModel>().showQuestionsByQR(results);
          await Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return QuizzPage(
              remainingTime: context.read<QuizViewModel>().quizTime,
              indexQuestion: 0,
              listQuiz: context.read<QuizViewModel>().listQuestion,
            );
          }));
        } else {
          setState(() {
            result =
                Barcode("QR Code tidak ditemukan", BarcodeFormat.qrcode, []);
          });
        }
      }
    } catch (e) {
      print('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to pick image')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
