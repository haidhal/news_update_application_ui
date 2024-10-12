// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:news_update_application_ui/controller/home_screen_controller.dart';
import 'package:news_update_application_ui/utils/color_constatnts.dart';
//import 'package:news_update_application_ui/view/home_screen/widget/news_card.dart';
//import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   // final homeScreenProvider = context.watch<HomeScreenController>();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        actions: const [
          CircleAvatar(
              radius: 30,
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              child: Icon(Icons.search)),
          SizedBox(
            width: 30,
          ),
          CircleAvatar(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              child: Icon(Icons.notifications_none_outlined))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
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
                  Text(
                    "View all",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
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
                  Text(
                    "View all",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>Container(),
                    // NewsCard(),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                    itemCount: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
