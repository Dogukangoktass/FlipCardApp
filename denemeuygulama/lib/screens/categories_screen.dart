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
      body: category == null
          ? Center(
        child: CircularProgressIndicator(), // Loading indicator
      )
          :  Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow,
              Colors.red,
              Color(0xFFfe17763),
              Color(0xFFe17763),
              Color(0xFF68998c),
            ],
            stops: [0.1, 0.4, 0.6, 0.8, 1],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
            child: ListView.builder(
            itemCount: category!.length,
            itemBuilder: (context, index){
              return Center(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                       ListTile(
                           tileColor: Colors.red.shade200.withOpacity(0.5),
                          title: Center(child: Text(
                            category![index].categoryName.toString()
                          )),
                      ),
                    ],
                  ),
                ),
              );
      }),
          )
    );
  }
}
