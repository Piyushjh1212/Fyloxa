import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../screens/result_screen.dart'; // 👈 create this

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  final MobileScannerController cameraController = MobileScannerController();

  bool isScanned = false;

  @override
  void initState() {
    super.initState();

    requestPermission();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);

    animation = Tween<double>(begin: -120, end: 120).animate(_controller);
  }

  Future<void> requestPermission() async {
    await Permission.camera.request();
  }

  @override
  void dispose() {
    _controller.dispose();
    cameraController.dispose();
    super.dispose();
  }

  void onScan(String code) {
    if (isScanned) return;

    isScanned = true;

    cameraController.stop();

    // 🔥 Navigate to result screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(code: code),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Scan QR",
            style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () => cameraController.toggleTorch(),
            icon: const Icon(Icons.flash_on, color: Colors.white),
          ),
        ],
      ),

      body: Stack(
        alignment: Alignment.center,
        children: [

          // 📷 CAMERA
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;

              for (final barcode in barcodes) {
                final String? code = barcode.rawValue;

                if (code != null) {
                  onScan(code);
                  break;
                }
              }
            },
          ),

          // 🔳 OVERLAY
          Container(color: Colors.black.withOpacity(0.5)),

          // 🔲 SCAN BOX
          Container(
            width: 260,
            height: 260,
          ),

          // 🔳 CORNERS
          SizedBox(
            width: 260,
            height: 260,
            child: Stack(
              children: [
                _corner(top: 0, left: 0),
                _corner(top: 0, right: 0),
                _corner(bottom: 0, left: 0),
                _corner(bottom: 0, right: 0),
              ],
            ),
          ),

          // 🔥 SCAN LINE
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Positioned(
                top: MediaQuery.of(context).size.height / 2 + animation.value,
                child: Container(
                  width: 240,
                  height: 2,
                  color: Colors.greenAccent,
                ),
              );
            },
          ),

          // 📄 TEXT
          const Positioned(
            bottom: 120,
            child: Text(
              "Align QR code inside frame",
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  Widget _corner({double? top, double? bottom, double? left, double? right}) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border(
            top: top != null
                ? const BorderSide(color: Colors.white, width: 3)
                : BorderSide.none,
            bottom: bottom != null
                ? const BorderSide(color: Colors.white, width: 3)
                : BorderSide.none,
            left: left != null
                ? const BorderSide(color: Colors.white, width: 3)
                : BorderSide.none,
            right: right != null
                ? const BorderSide(color: Colors.white, width: 3)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}