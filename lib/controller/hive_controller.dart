import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_update_application_ui/model/hive_model.dart';

class HiveController with ChangeNotifier {
  final newsBOx = Hive.box<Articlemodel>('newsCart');
  List<Articlemodel> news = [];
  List keys = [];
  addData({
    required String title,
    required String category,
    required DateTime publishedAt,
    required String author,
    required String? url,
    required String description,
    required String content,
  }) async {
    await newsBOx.add(Articlemodel(
        author: author,
        content: content,
        description: description,
        publishedAt: publishedAt,
        title: title,
        urlToImage: url));
    log(newsBOx.values.toString());
    getHiveData();
    // notifyListeners();
    //print("!!!!! add data");
  }

  getHiveData() {
    news = newsBOx.values.toList();

    notifyListeners();
    log("!!!!!!get data${news[0].category}");
  }

  deleteSavedNews(int index) {
    newsBOx.deleteAt(index);
    getHiveData();
  }
}
