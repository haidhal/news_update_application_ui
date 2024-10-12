// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_update_application_ui/utils/color_constatnts.dart';
//import 'package:news_update_application_ui/view/home_screen/widget/news_card.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.arrow_back_ios_new_outlined,
                    size: 30, color: ColorConstatnts.mainwhite),
              )),
        ),
        actions: [
          CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.bookmark_border_outlined,
                  size: 30,
                  color: ColorConstatnts.mainwhite,
                ),
              )),
          SizedBox(
            width: 8,
          ),
          CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.more_horiz,
                  size: 30,
                  color: ColorConstatnts.mainwhite,
                ),
              )),
        ],
      ),
      body: Stack(
        children: [
          Container(
           // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
             color: Colors.green,
          ),
          Container(
           
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200,),
                Container(
                  width: 100,
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstatnts.blue
                  ),
                  child: Center(
                    child: Text("category",
                    style: TextStyle(
                      color: ColorConstatnts.mainwhite
                    ),),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "title : Alexander wears modified helmet in road races",
                style: TextStyle(
                  fontSize: 25,
                  color: ColorConstatnts.mainwhite
                ),
                overflow: TextOverflow.ellipsis,),
                 SizedBox(height: 10,),
                Text("Trending  •  date",
                style: TextStyle(
                color: ColorConstatnts.mainwhite  
                ),),
                SizedBox(height: 15,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ColorConstatnts.mainwhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      )
                    ),
                    child:  ListView.separated(
                    shrinkWrap: true,
                   
                    itemBuilder: (context, index) => Container(),
                    //NewsCard(),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: 10),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
