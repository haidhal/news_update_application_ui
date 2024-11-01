import 'package:flutter/material.dart';
import 'package:news_update_application_ui/utils/color_constatnts.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.title,
    required this.author,
    this.category,
    required this.publishedAt,
    this.url,
    this.onDelete,
    this.deletebtn = false,
  });
  final String title;
  final String? category;
  final String publishedAt;
  final String author;
  final String? url;
  final VoidCallback? onDelete;
  final bool deletebtn;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstatnts.mainwhite,
            boxShadow: [
              BoxShadow(
                  color: ColorConstatnts.grey,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                  spreadRadius: 5),
            ]),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(url.toString()),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: false,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: ColorConstatnts.mainblack),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      author,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: ColorConstatnts.grey),
                    ),
                  ),
                ],
              ),
              deletebtn
                  ? IconButton(
                      onPressed: onDelete,
                      icon: Icon(
                        Icons.delete,
                        color: ColorConstatnts.grey,
                      ))
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
