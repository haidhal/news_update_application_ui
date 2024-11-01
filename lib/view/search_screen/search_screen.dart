import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_update_application_ui/controller/search_screen_controller.dart';
import 'package:news_update_application_ui/utils/color_constatnts.dart';
import 'package:news_update_application_ui/view/home_screen/home_screen.dart';
import 'package:news_update_application_ui/view/home_screen/widget/news_card.dart';
import 'package:news_update_application_ui/view/news_details_screen/news_detailed_screen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (timeStamp) async {
    //     await context.read<SearchScreenController>().onSearch(controller.text);
    //   },
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final searchScreenProvider = context.watch<SearchScreenController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColorConstatnts.grey,
            )),
        title: const Text(
          "Search Here",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Discover",
              style: TextStyle(
                  color: ColorConstatnts.mainblack,
                  fontWeight: FontWeight.bold,
                  fontSize: 38),
            ),
            Text(
              "News from all around the world",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: ColorConstatnts.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            SearchBar(
              controller: controller,
              hintText: "Search",
              leading: Icon(
                Icons.search,
                color: ColorConstatnts.grey,
              ),
              onChanged: (value) async {
                if (value.isNotEmpty) {
                  await context
                      .read<SearchScreenController>()
                      .onSearch(value.toLowerCase());
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Builder(
              builder: (context) {
                if (searchScreenProvider.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (searchScreenProvider.newsarticles.isEmpty) {
                  return const Center(child: Text("no data found"));
                } else {
                  return
                      // news updates - list view
                      Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NewsDetailedScreen(
                                                content: searchScreenProvider
                                                    .newsarticles[index].content
                                                    .toString(),
                                                author: searchScreenProvider
                                                    .newsarticles[index].author
                                                    .toString(),
                                                description:
                                                    searchScreenProvider
                                                        .newsarticles[index]
                                                        .description
                                                        .toString(),
                                                publishedAt:
                                                    searchScreenProvider
                                                        .newsarticles[index]
                                                        .publishedAt!,
                                                title: searchScreenProvider
                                                    .newsarticles[index].title
                                                    .toString())));
                              },
                              child: NewsCard(
                                author: searchScreenProvider
                                    .newsarticles[index].author
                                    .toString(),
                                publishedAt: searchScreenProvider
                                    .newsarticles[index].publishedAt
                                    .toString(),
                                category: searchScreenProvider
                                    .newsarticles[index].source
                                    .toString(),
                                title: searchScreenProvider
                                    .newsarticles[index].title
                                    .toString(),
                              ),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: searchScreenProvider.newsarticles.length),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
