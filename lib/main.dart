import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_update_application_ui/controller/hive_controller.dart';
import 'package:news_update_application_ui/controller/home_screen_controller.dart';
import 'package:news_update_application_ui/controller/search_screen_controller.dart';
import 'package:news_update_application_ui/model/hive_model.dart';
import 'package:news_update_application_ui/view/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ArticlemodelAdapter());
  var box = await Hive.openBox<Articlemodel>("newsCart");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchScreenController()),
        ChangeNotifierProvider(create: (context) => HiveController()),
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
       
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBarScreen(),
      ),
    );
  }
}
