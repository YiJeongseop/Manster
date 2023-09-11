import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manster/controllers/manga_controller.dart';

class SizeButtonWidget extends StatefulWidget {
  const SizeButtonWidget({Key? key, required this.sizeText, required this.mangaController}) : super(key: key);

  final String sizeText;
  final MangaController mangaController;

  @override
  State<SizeButtonWidget> createState() => _SizeButtonWidgetState();
}

class _SizeButtonWidgetState extends State<SizeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    String sizeText = widget.sizeText;
    MangaController mangaController = widget.mangaController;

    return TextButton(
      onPressed: () {
        (sizeText == "4x4")
            ? mangaController.setSize(4)
            : ((sizeText == "3x3")
                ? mangaController.setSize(3)
                : mangaController.setSize(2));
      },
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          const BorderSide(
            color: Colors.grey, // Border color
            width: 2.0, // Border width
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.grey.withOpacity(0.5);
            } else if (states.contains(MaterialState.hovered)) {
              return Colors.grey.withOpacity(0.2);
            }
            return null;
          },
        ),
      ),
      child: Text(
        "  $sizeText  ",
        style: GoogleFonts.comingSoon(
          fontSize: (screenWidth > 1080) ? screenWidth * 0.015 : 1080 * 0.015,
          color: Colors.black,
        ),
      ),
    );
  }
}
