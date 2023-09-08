import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:manster/controllers/manga_controller.dart';
import 'package:manster/controllers/title_search_controller.dart';
import 'package:manster/widgets/manga_list_widget.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TitleSearchController titleSearchController =
      Get.put(TitleSearchController());
  final MangaController mangaController = Get.put(MangaController());

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
                            ? screenWidth * 0.32 * 1.36
                            : 1080 * 0.32 * 1.36,
                        width: (screenWidth > 1080)
                            ? screenWidth * 0.15
                            : 1080 * 0.15,
                        margin: const EdgeInsets.all(8.0),
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
                                  mangaController.mangaList.value =
                                      await jikan.searchManga(
                                          query: value, rawQuery: '&sfw');
                                },
                              ),
                            ),
                            const Divider(),
                            Obx(
                              () => (mangaController.mangaList.value.isEmpty)
                                  ? Text(
                                      "No search results found",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.comingSoon(
                                        fontSize: (screenWidth > 1080)
                                            ? screenWidth * 0.012
                                            : 1080 * 0.012,
                                      ),
                                    )
                                  : MangaListWidget(mangaList: mangaController.mangaList.value),
                            ),
                            const Divider(),
                            SizedBox(height: (screenWidth > 1080)
                                ? screenWidth * 0.32 * 0.08
                                : 1080 * 0.32 * 0.08,)
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xFFD2D2D2),
                        height: (screenWidth > 1080)
                            ? screenWidth * 0.32 * 1.36
                            : 1080 * 0.32 * 1.36,
                        width: (screenWidth > 1080)
                            ? screenWidth * 0.32
                            : 1080 * 0.32,
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          childAspectRatio: 1 / 1.36,
                          children: [
                            Container(
                              color: Colors.white,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(8.0),
                            ),
                            Container(
                              color: Colors.white,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(8.0),
                            ),
                            Container(
                              color: Colors.white,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(8.0),
                            ),
                            Container(
                              color: Colors.white,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(8.0),
                            ),
                            Container(
                              color: Colors.white,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(8.0),
                            ),
                            Container(
                              color: Colors.white,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(8.0),
                            ),
                            Container(
                              color: Colors.white,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(8.0),
                            ),
                            Container(
                              color: Colors.white,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(8.0),
                            ),
                            Container(
                              color: Colors.white,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(8.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: (screenWidth > 1080)
                            ? screenWidth * 0.32 * 1.36
                            : 1080 * 0.32 * 1.36,
                        width: (screenWidth > 1080)
                            ? screenWidth * 0.15
                            : 1080 * 0.15,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD2D2D2),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          border: Border.all(color: Colors.black, width: 2),
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
}
