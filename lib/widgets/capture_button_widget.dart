import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screenshot/screenshot.dart';

class CaptureButtonWidget extends StatelessWidget {
  const CaptureButtonWidget({Key? key, required this.screenshotController})
      : super(key: key);

  final ScreenshotController screenshotController;

  @override
  Widget build(BuildContext context) {
    // final isMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);
    final screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () async {
        screenshotController.capture().then((Uint8List? image) {
          final base64 = base64Encode(image!);
          final anchor = AnchorElement(
              href: 'data:application/octet-stream;base64,$base64')
            ..download = "manster.png"
            ..target = 'blank';

          document.body!.append(anchor);
          anchor.click();
          anchor.remove();
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: Colors.black45, // Border color
            width: 2.0, // Border width
          ),
        ),
      ),
      child: Text(
        "Capture",
        style: GoogleFonts.comingSoon(
            fontSize: (screenWidth > 1080) ? screenWidth * 0.015 : 1080 * 0.015,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
