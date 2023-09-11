import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:html' as html;

import 'package:manster/controllers/manga_controller.dart';
import 'package:manster/controllers/title_search_controller.dart';
import 'package:manster/widgets/capture_button_widget.dart';
import 'package:manster/widgets/manga_list_widget.dart';
import 'package:manster/widgets/size_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final jikan = Jikan();
  final TitleSearchController titleSearchController =
      Get.put(TitleSearchController());
  final MangaController mangaController = Get.put(MangaController());
  ScreenshotController screenshotController = ScreenshotController();
  Color gridViewColor = const Color(0xFFD2D2D2);
  Color pickerColor = const Color(0xFFD2D2D2);

  @override
  void dispose() {
    titleSearchController.dispose();
    mangaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Manster",
                        style: GoogleFonts.comingSoon(
                            fontSize: (screenWidth > 1080)
                                ? screenWidth * 0.03
                                : 1080 * 0.03,
                            fontWeight: FontWeight.w600),
                      ),
                      Image.asset(
                        'assets/images/rest.png',
                        height: (screenWidth > 1080)
                            ? screenWidth * 0.02
                            : 1080 * 0.02,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: (screenWidth > 1080)
                            ? screenWidth * 0.31 * 1.36
                            : 1080 * 0.31 * 1.36,
                        width: (screenWidth > 1080)
                            ? screenWidth * 0.15
                            : 1080 * 0.15,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD2D2D2),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: (screenWidth > 1080)
                                  ? EdgeInsets.fromLTRB(
                                      screenWidth * 0.01,
                                      screenWidth * 0.03,
                                      screenWidth * 0.01,
                                      screenWidth * 0.01)
                                  : const EdgeInsets.fromLTRB(1080 * 0.01,
                                      1080 * 0.03, 1080 * 0.01, 1080 * 0.01),
                              child: TextField(
                                style: GoogleFonts.comingSoon(
                                  fontSize: (screenWidth > 1080)
                                      ? screenWidth * 0.013
                                      : 1080 * 0.013,
                                ),
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: const InputDecoration(
                                  hintText: 'Enter a title',
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) => titleSearchController
                                    .updateSearchText(value),
                                textInputAction: TextInputAction.go,
                                // Enter key event
                                onSubmitted: (value) async {
                                  if (titleSearchController.canSubmit) {
                                    mangaController.mangaList.value = await jikan.searchManga(query: value, rawQuery: '&sfw');
                                  } else {
                                    showSnackbar(context, screenWidth, "Please enter it in a few seconds later.");
                                  }
                                  titleSearchController.changeCanSubmit();
                                },
                              ),
                            ),
                            const Divider(),
                            Expanded(
                              child: Obx(
                                () => (mangaController.mangaList.value.isEmpty)
                                    ? Text(
                                        "No search results found",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.comingSoon(
                                          fontSize: (screenWidth > 1080)
                                              ? screenWidth * 0.012
                                              : 1080 * 0.012,
                                          color: Colors.black,
                                        ),
                                      )
                                    : MangaListWidget(
                                        mangaList:
                                            mangaController.mangaList.value),
                              ),
                            ),
                            const Divider(),
                            Text(
                              "If there are many users, \n it may not be searched.",
                              style: GoogleFonts.comingSoon(
                                fontSize: (screenWidth > 1080)
                                    ? screenWidth * 0.008
                                    : 1080 * 0.008,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Screenshot(
                        controller: screenshotController,
                        child: Container(
                          color: gridViewColor,
                          height: (screenWidth > 1080)
                              ? screenWidth * 0.31 * 1.36
                              : 1080 * 0.31 * 1.36,
                          width: (screenWidth > 1080)
                              ? screenWidth * 0.31
                              : 1080 * 0.31,
                          child: GetBuilder<MangaController>(
                            builder: (_) => GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: mangaController.size,
                              childAspectRatio: 1 / 1.36,
                              children: List.generate(
                                mangaController.size * mangaController.size, (index) {
                                  return DragTarget<String>(
                                    builder: (context, candidateData, rejectedData) {
                                      return GestureDetector(
                                        onTap: () {
                                          if (mangaController.selectedIndex == -1) {
                                            mangaController.setSelectedIndex(index);
                                          } else {
                                            final temp = mangaController.gridImages[index];
                                            mangaController.setGridImages(index, mangaController.gridImages[mangaController.selectedIndex]);
                                            mangaController.setGridImages(mangaController.selectedIndex, temp);
                                            mangaController.setSelectedIndex(-1);
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: (mangaController.selectedIndex == index)
                                                  ? Border.all(color: Colors.yellow, width: 2)
                                                  : null,
                                              color: Colors.white),
                                          margin: const EdgeInsets.all(5),
                                          child: mangaController.gridImages[index] != null
                                              ? Image.network(mangaController.gridImages[index]!, fit: BoxFit.fill,)
                                              : const Text(''),
                                        ),
                                      );
                                    },
                                    onWillAccept: (data) {
                                      return true;
                                    },
                                    onAccept: (data) {
                                      mangaController.setGridImages(index, data);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: (screenWidth > 1080)
                            ? screenWidth * 0.31 * 1.36
                            : 1080 * 0.31 * 1.36,
                        width: (screenWidth > 1080)
                            ? screenWidth * 0.15
                            : 1080 * 0.15,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD2D2D2),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: (screenWidth > 1080)
                                  ? EdgeInsets.fromLTRB(
                                      screenWidth * 0.01,
                                      screenWidth * 0.05,
                                      screenWidth * 0.01,
                                      screenWidth * 0.01)
                                  : const EdgeInsets.fromLTRB(1080 * 0.01,
                                      1080 * 0.05, 1080 * 0.01, 1080 * 0.01),
                              child: TextButton(
                                onPressed: () {
                                  colorDialog(context, screenWidth);
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.grey),
                                  side: MaterialStateProperty.all(
                                    const BorderSide(
                                      color: Colors.black45, // Border color
                                      width: 2.0, // Border width
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Change Color",
                                  style: GoogleFonts.comingSoon(
                                    fontSize: (screenWidth > 1080)
                                        ? screenWidth * 0.012
                                        : 1080 * 0.012,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            SizeButtonWidget(
                              sizeText: "2x2",
                              mangaController: mangaController,
                            ),
                            SizedBox(
                              height: (screenWidth > 1080)
                                  ? screenWidth * 0.31 * 0.04
                                  : 1080 * 0.31 * 0.04,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                SizeButtonWidget(
                                  sizeText: "3x3",
                                  mangaController: mangaController,
                                ),
                                SizeButtonWidget(
                                  sizeText: "4x4",
                                  mangaController: mangaController,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: (screenWidth > 1080)
                                  ? screenWidth * 0.31 * 0.04
                                  : 1080 * 0.31 * 0.04,
                            ),
                            CaptureButtonWidget(screenshotController: screenshotController),
                            Expanded(child: Container()),
                            Padding(
                              padding: (screenWidth > 1080)
                                  ? EdgeInsets.fromLTRB(
                                      screenWidth * 0.01,
                                      screenWidth * 0.015,
                                      screenWidth * 0.01,
                                      screenWidth * 0.05)
                                  : const EdgeInsets.fromLTRB(1080 * 0.01,
                                      1080 * 0.015, 1080 * 0.01, 1080 * 0.05),
                              child: TextButton(
                                onPressed: () {
                                  html.window.open(
                                      'https://twitter.com/YiJeongseop',
                                      "Developer's Twitter");
                                },
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    const BorderSide(
                                      color: Colors.grey, // Border color
                                      width: 2.0, // Border width
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
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
                                  "Developer's Twitter",
                                  style: GoogleFonts.comingSoon(
                                    fontSize: (screenWidth > 1080)
                                        ? screenWidth * 0.008
                                        : 1080 * 0.008,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Create your favorite manga collection!",
                        style: GoogleFonts.comingSoon(
                          fontSize: (screenWidth > 1080)
                              ? screenWidth * 0.01
                              : 1080 * 0.01,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void colorDialog(BuildContext context, double screenWidth) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Align(
                alignment: Alignment.center,
                child: AlertDialog(
                  title: Text(
                    'Pick a color!',
                    style: GoogleFonts.comingSoon(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  content: ColorPicker(
                    pickerColor: pickerColor,
                    onColorChanged: changeColor,
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          gridViewColor = pickerColor;
                          Get.back();
                        });
                      },
                      child: Text(
                        'Got it',
                        style: GoogleFonts.comingSoon(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void showSnackbar(BuildContext context, double screenWidth, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.comingSoon(
            fontSize: (screenWidth > 1080) ? screenWidth * 0.013 : 1080 * 0.013,
            color: Colors.white,
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
