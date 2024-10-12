import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_update_application_ui/utils/color_constatnts.dart';

class NewsCard extends StatelessWidget {
   NewsCard({super.key,
  required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100 ,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:ColorConstatnts.grey
          ),
          // child: Image.network("",
          // fit: BoxFit.cover,),
        ),
        SizedBox(width: 15,),
        Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("category",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color:ColorConstatnts.grey
          ),),
          SizedBox(
            width: 200,
            child: Text(title,
             // "news title : what training do vollyball players need ?",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    softWrap: false,
                     style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: ColorConstatnts.mainblack
                     ),),
          ),
         Row(children: [
          Text("reporter name",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorConstatnts.grey
          ),),
          Text(" ",
          style: TextStyle(
            fontSize: 40,
            color:ColorConstatnts.grey
          ),),
           Text("date",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color:ColorConstatnts.grey
          ),),
         ],)
        ],)
      ],
    );
  }
}