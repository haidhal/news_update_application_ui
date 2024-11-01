import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_update_application_ui/model/search_screen_model.dart';

class SearchScreenController with ChangeNotifier {
  NewsResModel? newsResModel;
  List<Article> newsarticles = [];
  bool isLoading = false;
  Future<void> onSearch(String keyword) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$keyword&apiKey=b622ee2ed5654c1288c1037a30e4e833");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        newsResModel = newsResModelFromJson(response.body);
        newsarticles = newsResModel!.articles ?? [];
        log("!!!! success ${newsarticles[0].publishedAt}");
      } else {
        log("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      log(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}
