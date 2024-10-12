//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_update_application_ui/utils/color_constatnts.dart';
import 'package:news_update_application_ui/view/home_screen/home_screen.dart';
import 'package:news_update_application_ui/view/profile_screen/profile_screen.dart';
import 'package:news_update_application_ui/view/saved_screen/saved_screen.dart';
import 'package:news_update_application_ui/view/search_screen/search_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  List screenList = [
    HomeScreen(),
    SearchScreen(),
    SavedScreen(),
    ProfileScreen()
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body: screenList[selectedIndex],
 
 bottomNavigationBar: BottomNavigationBar(
  currentIndex:   selectedIndex,
  selectedItemColor: ColorConstatnts.mainblack,
  unselectedItemColor: ColorConstatnts.grey,
  items: [
   BottomNavigationBarItem(icon: Icon(Icons.home,),label: "home"),
   BottomNavigationBarItem(icon: Icon(Icons.blur_circular_rounded,),label: "search"),
     BottomNavigationBarItem(icon: Icon(Icons.bookmark_border_rounded,),label: "saved"),
       BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded,),label: "profile"),

  ],
  onTap: (int value){
    selectedIndex = value;
    setState(() {
      
    });
  },
  ),
    );
  }
}


// bottom nav bar package
// import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
// import 'package:flutter/material.dart';
// import 'package:news_update_application_ui/view/home_screen/home_screen.dart';
// import 'package:news_update_application_ui/view/profile_screen/profile_screen.dart';
// import 'package:news_update_application_ui/view/saved_screen/saved_screen.dart';
// import 'package:news_update_application_ui/view/search_screen/search_screen.dart';

// class BottomNavBarScreen extends StatefulWidget {
//   const BottomNavBarScreen({super.key});

//   @override
//   State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
// }

// class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
//   List screenList = [
//     const HomeScreen(),
//     const SearchScreen(),
//     const SavedScreen(),
//     const ProfileScreen()
//   ];
//   int currentPage = 0;
//   @override
//   Widget build(BuildContext context) {
//     var scrollController;
//    // var currentPage;
//     return Scaffold(
//     body: screenList[currentPage],
//     bottomNavigationBar: DotCurvedBottomNav(
//     scrollController: scrollController,
//     hideOnScroll : true,
//     indicatorColor: Colors.blue,
//     backgroundColor: Colors.black,
//     animationDuration: const Duration(milliseconds: 300),
//     animationCurve: Curves.ease,
//     selectedIndex: currentPage,
//     indicatorSize: 5,
//     borderRadius: 25,
//     height: 70,
//     onTap: (index) {
//     setState(() => currentPage = index);
//     },
//     items: [
//     Icon(
//         Icons.home,
//         color: currentPage == 0 ? Colors.blue : Colors.white,
//     ),
//     Icon(
//         Icons.notification_add,
//         color: currentPage == 1 ? Colors.blue : Colors.white,
//     ),
//     Icon(
//         Icons.color_lens,
//         color: currentPage == 2 ? Colors.blue : Colors.white,
//     ),
//     Icon(
//         Icons.person,
//         color: currentPage == 3 ? Colors.blue : Colors.white,
//     ),
//     ],
// ),
//     );
//   }
// }



// code copied from pub dev
// bottomNavigationBar: DotCurvedBottomNav(
//     scrollController: _scrollController,
//     hideOnScroll: true,
//     indicatorColor: Colors.blue,
//     backgroundColor: Colors.black,
//     animationDuration: const Duration(milliseconds: 300),
//     animationCurve: Curves.ease,
//     selectedIndex: _currentPage,
//     indicatorSize: 5,
//     borderRadius: 25,
//     height: 70,
//     onTap: (index) {
//     setState(() => _currentPage = index);
//     },
//     items: [
//     Icon(
//         Icons.home,
//         color: _currentPage == 0 ? Colors.blue : Colors.white,
//     ),
//     Icon(
//         Icons.notification_add,
//         color: _currentPage == 1 ? Colors.blue : Colors.white,
//     ),
//     Icon(
//         Icons.color_lens,
//         color: _currentPage == 2 ? Colors.blue : Colors.white,
//     ),
//     Icon(
//         Icons.person,
//         color: _currentPage == 3 ? Colors.blue : Colors.white,
//     ),
//     ],
// ),