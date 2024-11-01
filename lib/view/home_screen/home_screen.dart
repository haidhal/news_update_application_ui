import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_update_application_ui/controller/home_screen_controller.dart';
import 'package:news_update_application_ui/utils/app_images.dart';
//import 'package:news_update_application_ui/utils/app_images.dart';
import 'package:news_update_application_ui/utils/color_constatnts.dart';
import 'package:news_update_application_ui/view/home_screen/widget/news_card.dart';
import 'package:news_update_application_ui/view/news_details_screen/news_detailed_screen.dart';
import 'package:news_update_application_ui/view/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<HomeScreenController>().getAllNews();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = context.watch<HomeScreenController>();

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
        ),
        actions: [
          InkWell(
            onTap: () {
              // Provider.of<HomeScreenController>(context, listen: false)
              //     .getAllNews();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
            },
            child: const CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                child: Icon(Icons.search)),
          ),
          const SizedBox(
            width: 30,
          ),
         
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Breaking News",
                  style: TextStyle(
                      color: ColorConstatnts.mainblack,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "View all",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            homeScreenProvider.isLoading
                ? const CircularProgressIndicator()
                : CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                    itemCount: homeScreenProvider.newsarticles.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsDetailedScreen(
                                        content: homeScreenProvider
                                            .newsarticles[itemIndex].content
                                            .toString(),
                                        author: homeScreenProvider
                                            .newsarticles[itemIndex].author
                                            .toString(),
                                        description: homeScreenProvider
                                            .newsarticles[itemIndex].description
                                            .toString(),
                                        category: homeScreenProvider
                                            .newsarticles[itemIndex].source
                                            .toString(),
                                        publishedAt: homeScreenProvider
                                            .newsarticles[itemIndex]
                                            .publishedAt!,
                                        title: homeScreenProvider.newsarticles[itemIndex].title
                                            .toString())));
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      homeScreenProvider.newsarticles[itemIndex]
                                                  .urlToImage !=
                                              null
                                          ? homeScreenProvider
                                              .newsarticles[itemIndex]
                                              .urlToImage
                                              .toString()
                                          : AppImages.newsdefultImg.toString(),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.6),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: SizedBox(
                                  height: 100,
                                  width: 160,
                                  child: Column(children: [
                                    Text(
                                      homeScreenProvider
                                          .newsarticles[itemIndex].title
                                          .toString(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommendation",
                  style: TextStyle(
                      color: ColorConstatnts.mainblack,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "View all",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child:homeScreenProvider.newsarticles.isEmpty ? Center(child: Text("no recommendations available"),)
              : ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsDetailedScreen(
                                        content: homeScreenProvider
                                            .newsarticles[index].content
                                            .toString(),
                                        title: homeScreenProvider
                                            .newsarticles[index].title
                                            .toString(),
                                        author: homeScreenProvider
                                            .newsarticles[index].author
                                            .toString(),
                                        description: homeScreenProvider
                                            .newsarticles[index].description
                                            .toString(),
                                        category: homeScreenProvider
                                            .newsarticles[index].source
                                            .toString(),
                                        publishedAt: homeScreenProvider
                                            .newsarticles[index].publishedAt!,
                                        url: homeScreenProvider
                                                    .newsarticles[index]
                                                    .urlToImage !=
                                                null
                                            ? homeScreenProvider
                                                .newsarticles[index].urlToImage
                                                .toString()
                                            : AppImages.newsdefultImg
                                                .toString(),
                                      )));
                        },
                        child: NewsCard(
                          title: homeScreenProvider.newsarticles[index].title
                              .toString(),
                          author: homeScreenProvider
                              .newsarticles[index].author
                              .toString(),
                          publishedAt: homeScreenProvider
                              .newsarticles[index].publishedAt
                              .toString(),
                          category: homeScreenProvider
                              .newsarticles[index].source
                              .toString(),
                          url: homeScreenProvider
                                      .newsarticles[index].urlToImage !=
                                  null
                              ? homeScreenProvider
                                  .newsarticles[index].urlToImage
                                  .toString()
                              : AppImages.newsdefultImg.toString(),
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                  itemCount: homeScreenProvider.newsarticles.length),
            ),
          ],
        ),
      ),
    );
  }
}
