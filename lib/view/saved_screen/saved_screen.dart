// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_update_application_ui/controller/hive_controller.dart';
import 'package:news_update_application_ui/utils/app_images.dart';
import 'package:news_update_application_ui/utils/color_constatnts.dart';
import 'package:news_update_application_ui/view/home_screen/widget/news_card.dart';
import 'package:provider/provider.dart';
//import 'package:news_update_application_ui/view/home_screen/widget/news_card.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<HiveController>().getHiveData();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final savedScreenProvider = context.watch<HiveController>();
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Read Later",
            style: TextStyle(
                color: ColorConstatnts.mainblack,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
        ),
        actions: [
          CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.more_vert,
                  size: 30,
                  color: ColorConstatnts.mainblack,
                ),
              )),
          SizedBox(
            width: 20,
          )
        ],
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(10.0),
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: ListView.separated(
      //           itemBuilder: (context, index) => NewsCard(
      //             deletebtn: true,
      //             onDelete:
      //                 context.read<HiveController>().deleteSavedNews(index),
      //             title: savedScreenProvider.news[index].title.toString(),
      //             author: savedScreenProvider.news[index].author.toString(),
      //             publishedAt:
      //                 savedScreenProvider.news[index].publishedAt.toString(),
      //             category: savedScreenProvider.news[index].category.toString(),
      //             url: savedScreenProvider.news[index].urlToImage != null
      //                 ? savedScreenProvider.news[index].urlToImage.toString()
      //                 : AppImages.newsdefultImg.toString(),
      //           ),
      //           separatorBuilder: (context, index) =>
      //               const SizedBox(height: 10),
      //           itemCount: savedScreenProvider.news.length,
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
