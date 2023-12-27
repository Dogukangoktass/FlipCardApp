import 'package:denemeuygulama/models/category.dart'as td;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/drawer.dart';
import '../models/category.dart';
import '../services/category_api.dart';


class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key, required this.userId});
  final int userId;
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
        drawer: DrawerView(userId: widget.userId),
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          automaticallyImplyLeading: false,
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu_rounded, color: Colors.red),
                );
              },
            ),
          ],
        ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow,
              Colors.red,
              Color(0xFFfe17763),
              Color(0xFFe17763),
              Color(0xffb3ead8),
            ],
            stops: [0.1, 0.4, 0.6, 0.8, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: category == null || category!.isEmpty ? Center(
          child: Text("Kategoriler Yükleniyor...", style: TextStyle(
              fontSize: 30,
              color: Colors.white70
          ),),)
            :  ListView.builder(
          itemCount: category!.length,
          itemBuilder: (context, index) {
            return Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: ListTile(
                        title: Column(
                          children: [
                                Text(category![index].categoryName.toString(),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
          )
    );
  }
}
