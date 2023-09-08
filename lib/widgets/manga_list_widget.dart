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
    BuiltList<Manga> mangaList = widget.mangaList;

    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
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
          );
        }, separatorBuilder: (BuildContext context, int index) { return const Divider(); },
      ),
    );
  }
}
