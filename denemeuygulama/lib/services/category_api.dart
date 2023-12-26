import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/category.dart';
class CategoryApi{

  Future<List<Category>?> getCategory() async {
    var client= http.Client();
    final uri=Uri.parse("https://webapi20231207005716.azurewebsites.net/api/Category/GetCategories");
    final response=await client.get(uri);

    if(response.statusCode==200)
      {
        var json= response.body;
        return categoryFromJson(json);
      }

    else {throw Exception('failed to load categories');}
  }




}