import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/word.dart';
class WordApi{

  Future<List<Word>?> getWords() async {
    var client= http.Client();
    final uri=Uri.parse("https://webapi20231207005716.azurewebsites.net/api/Words/GetWords");
    final response=await client.get(uri);

    if(response.statusCode==200)
    {
      var json= response.body;
      return wordFromJson(json);
    }
    else {throw Exception('failed to load categories');}
  }



}