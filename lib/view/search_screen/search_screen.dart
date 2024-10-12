import 'package:flutter/material.dart';
import 'package:news_update_application_ui/controller/search_screen_controller.dart';
import 'package:news_update_application_ui/utils/color_constatnts.dart';
import 'package:news_update_application_ui/view/home_screen/home_screen.dart';
import 'package:news_update_application_ui/view/home_screen/widget/news_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
   await context.read<SearchScreenController>().onSearch(controller.text);  
   },);
  
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final searchScreenProvider = context.watch<SearchScreenController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColorConstatnts.grey,
            )),

        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: ColorConstatnts.grey),
              ),
              SizedBox(
                height: 20,
              ),
              SearchBar(
                controller: controller,
                  hintText: "Search",
                  leading: IconButton(
                    onPressed: () {
                      context
                          .read<SearchScreenController>()
                          .onSearch(controller.text);
                    },
                    
                    icon: Icon(
                      Icons.search,
                      color: ColorConstatnts.grey,
                    ),
                  ),
                  onChanged: (value) {
                   if(value.isEmpty){
                    context.read<SearchScreenController>().onSearch(controller.text);
                   } 
                  },
                  ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      10,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 18),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey,
                                ),
                                child: Center(
                                  child: Text(
                                    "categories",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: ColorConstatnts.mainblack,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Builder(builder: (context) {
                   if(searchScreenProvider.isLoading){
                      return Center(child: CircularProgressIndicator(),);
                   }else 
                   if(searchScreenProvider.newsarticles.isEmpty){
                      return Center(child: Text("no data found"));
                   }else
                   {
                    return 
                    // news updates - list view
                  SingleChildScrollView(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => NewsCard(
                          title: searchScreenProvider.newsarticles[index].title.toString(),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: searchScreenProvider.newsarticles.length),
                  );
                   }
                 },),
             
             
              
            ],
          ),
        ),
      ),
    );
  }
}
