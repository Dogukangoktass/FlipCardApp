import 'package:denemeuygulama/models/category.dart'as td;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/category.dart';
import '../services/category_api.dart';


class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  List<Category>? category;

  void initState() {
    super.initState();
   getData();
  }
  getData() async{
    category= await CategoryApi().getCategory();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: category!.length,
          itemBuilder: (context, index){
            return Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                     ListTile(
                      title: Center(child: Text(
                        category![index].categoryName.toString()
                      )),
                    ),
                  ],
                ),
              ),
            );
      })
    );
  }
}
