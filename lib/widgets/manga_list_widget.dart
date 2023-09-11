import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';

class MangaListWidget extends StatefulWidget {
  const MangaListWidget({Key? key, required this.mangaList}) : super(key: key);

  final BuiltList<Manga> mangaList;

  @override
  State<MangaListWidget> createState() => _MangaListWidgetState();
}

class _MangaListWidgetState extends State<MangaListWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    BuiltList<Manga> mangaList = widget.mangaList;

    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: (mangaList.length > 4) ? 5 : mangaList.length,
      itemBuilder: (context, index) {
        return Draggable(
          data: mangaList[index].imageUrl,
          feedback: CachedNetworkImage(
            imageUrl: mangaList[index].imageUrl,
            fit: BoxFit.fill,
            height: (screenWidth > 1080)
                ? screenWidth * 0.1 * 1.36
                : 1080 * 0.1 * 1.36,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            progressIndicatorBuilder: (context, url, downloadProgress) => Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
            ),
          ),
          child: ListTile(
            title: CachedNetworkImage(
              imageUrl: mangaList[index].imageUrl,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, downloadProgress) => Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) { return const Divider(); },
    );
  }
}
