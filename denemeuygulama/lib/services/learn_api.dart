import 'dart:convert';
import 'package:denemeuygulama/models/favoriteword.dart';
import 'package:denemeuygulama/models/learnword.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/category.dart';
class LearnApi{

  Future<List<LearnWord>?> getLearns(int id) async {
    var client= http.Client();
    final uri=Uri.parse("https://webapi20231207005716.azurewebsites.net/api/Learn/GetLearnWordsWithUser?userId=${id}");
    final response=await client.get(uri);
    if(response.statusCode==200)
    {
      print(response.body);
      var json= response.body;
      return learnWordFromJson(json);
    }
    else {throw Exception('failed to load categories');}
  }
}