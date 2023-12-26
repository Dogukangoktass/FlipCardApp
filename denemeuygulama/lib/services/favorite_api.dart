import 'dart:convert';
import 'package:denemeuygulama/models/favoriteword.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/category.dart';
class FavoriteApi{

  Future<List<FavoriteWord>?> getFavorites(int id) async {
    var client= http.Client();
    final uri=Uri.parse("https://webapi20231207005716.azurewebsites.net/api/Favorite/GetWordsWithUser?userId=${id}");
    final response=await client.get(uri);
    if(response.statusCode==200)
    {
      print(response.body);
      var json= response.body;
      return favoriteWordFromJson(json);
    }
    else {throw Exception('failed to load categories');}
  }

  Future addFavorite(int userId, int wordId) async{
    Map data={
      "wordId": wordId,
      "userId": userId,
    };
    var body = jsonEncode(data);
    final response = await http.post(Uri.parse("uri"), body: body);
    print(response.body);
  }
  /*  Map<String, dynamic> requestBody = {
      "favoriteWordId": 0,
      "wordId": wordId,
      "userId": userId,
      "words": {
        "wordId": 0,
        "categoryId": 0,
        "wordTr": wordTr,
        "wordEn": wordEn,
        "sentenceEn": sentenceEn,
        "sentenceTr": sentenceTr,
      },
    };*/






}