// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_update_application_ui/utils/color_constatnts.dart';
import 'package:news_update_application_ui/view/saved_screen/saved_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_outlined,
          color: ColorConstatnts.grey,
        ),
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(
                color: ColorConstatnts.mainblack,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Icon(
            Icons.edit,
            color: ColorConstatnts.blue,
          ),
          Text(
            "Edit",
            style: TextStyle(
                color: ColorConstatnts.blue,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 40,
                //child: Image.network(""),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Jennifer Vars",
                style: TextStyle(
                    fontSize: 25,
                    color: ColorConstatnts.mainblack,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                "@Jenifer_vans06",
                style: TextStyle(
                    color: ColorConstatnts.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(159, 133, 237, 192),
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '''Hey its seems like you haven't ''',
                    style: TextStyle(
                        color: ColorConstatnts.mainblack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '''add any topic yet ''',
                    style: TextStyle(
                        color: ColorConstatnts.mainblack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 150,
                    decoration: BoxDecoration(
                        color: ColorConstatnts.mainblack,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_circle_outline_sharp,
                            color: ColorConstatnts.mainwhite,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add topic",
                            style: TextStyle(color: ColorConstatnts.mainwhite),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Your collection",
                  style: TextStyle(
                      color: ColorConstatnts.mainblack,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                Spacer(),
                IconButton(onPressed: (){
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context)=>SavedScreen()));
                }, icon: Icon(Icons.arrow_forward_ios_sharp,
                color: ColorConstatnts.mainblack,))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Account Setings",
              style: TextStyle(
                  color: ColorConstatnts.mainblack,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.indigo.shade300,
                  radius: 30,
                  child: Icon(
                    Icons.person_outline_sharp,
                    color: ColorConstatnts.mainblack,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Profile",
                      style: TextStyle(
                          color: ColorConstatnts.mainblack,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    Text(
                      "Edit and view profile info",
                      style: TextStyle(
                          color: ColorConstatnts.mainblack,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
