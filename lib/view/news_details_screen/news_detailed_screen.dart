import 'package:flutter/material.dart';
import 'package:news_update_application_ui/controller/hive_controller.dart';
import 'package:news_update_application_ui/utils/color_constatnts.dart';
import 'package:provider/provider.dart';

class NewsDetailedScreen extends StatelessWidget {
  const NewsDetailedScreen(
      {super.key,
      required this.content,
      required this.author,
      required this.description,
      this.category,
      required this.publishedAt,
      this.url,
      required this.title});
  final String title;
  final String? category;
  final DateTime publishedAt;
  final String author;
  final String? url;
  final String description;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.read<HiveController>().addData(
              author: author,
              category: category!,
              content: content,
              description: description,
              publishedAt: publishedAt,
              title: title,
              url: url);

          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => SavedScreen()));
        },
        child: const Icon(Icons.bookmark_add_outlined),
      ),
      appBar: AppBar(
        title: const Text("News Updates"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                SizedBox(
                  width: 135,
                  child: Text(
                    publishedAt.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    softWrap: false,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: ColorConstatnts.mainblack),
                  ),
                ),
              ],
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(url.toString()),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              title.toString(),
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: ColorConstatnts.mainblack),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              author,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: false,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: ColorConstatnts.mainblack),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              softWrap: false,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: ColorConstatnts.mainblack),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              content,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: false,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: ColorConstatnts.mainblack),
            ),
          ],
        ),
      ),
    );
  }
}
