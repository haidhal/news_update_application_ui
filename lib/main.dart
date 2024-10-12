import 'package:flutter/material.dart';
import 'package:news_update_application_ui/controller/home_screen_controller.dart';
import 'package:news_update_application_ui/controller/search_screen_controller.dart';
import 'package:news_update_application_ui/view/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:news_update_application_ui/view/saved_screen/saved_screen.dart';
//import 'package:news_update_application_ui/view/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
//import 'package:news_update_application_ui/view/home_screen/home_screen.dart';
import 'package:news_update_application_ui/view/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>SearchScreenController()),
        ChangeNotifierProvider(create: (context)=>HomeScreenController())
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
           home: BottomNavBarScreen()),
    );
  }
}
