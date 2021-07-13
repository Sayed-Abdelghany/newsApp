import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:news_app/Model/NewsModel.dart';
class ApiHelper {
  var apiKey = '073efbcebb634a65b14ab407d1941875';

Future<List<NewsModel>>  getNews() async {
    List<NewsModel> news = [];
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg=&apiKey=$apiKey'));
    var body = jsonDecode(response.body);
    try {
      if (body["status"] == 'ok') {
        body["articles"].forEach((article) {
          NewsModel newsModel = NewsModel(
            title: article["title"],
            time: article["publishedAt"],
            url: article["url"],
            imageUrl: article["urlToImage"],
            author: article["author"],
            desc: article["description"],
          );
          news.add(newsModel);
        }
        );
      }
      else {
        print('No Data');
      }
    }
    catch (e) {
      print(e);
    }
    return news;
  }

  getNewsByCategory(category) async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey'));
    var body = jsonDecode(response.body);
    List<NewsModel> news = [];
    try {
      if (body["status"] == 'ok') {
        body["articles"].forEach((article) {
          NewsModel newsModel = NewsModel(
            title: article["title"],
            time: article["publishedAt"],
            url: article["url"],
            imageUrl: article["urlToImage"],
            author: article["author"],
            desc: article["description"],
          );
          news.add(newsModel);
        }
        );
      }
      else {
        print('No Data');
      }
    }
    catch (e) {
      print(e);
    }
    return news;
  }
}
