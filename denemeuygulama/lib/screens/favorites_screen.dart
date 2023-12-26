import 'package:flutter/material.dart';

import '../models/favoriteword.dart';
import '../services/favorite_api.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key, required this.userId});
  final int userId;

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  List<FavoriteWord>? favorites;

  void initState() {
    super.initState();
    print(widget.userId);
    getData();
  }
  /*getData() async{
    favorites= await FavoriteApi().getFavorites(widget.userId); //widget.userId
  }*/

  getData() async{
    var mWords =await FavoriteApi().getFavorites(widget.userId);
    setState(() {
      if(mounted){
        favorites =mWords;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: favorites!.length,
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
                          Row(
                            children: [
                             Spacer(),
                              Text(favorites![index].wordTr.toString(),),
                             Spacer(),
                             Text(favorites![index].wordEn.toString(),),
                              Spacer()
                            ],
                          ),
                          Text(favorites![index].sentenceEn.toString(),),
                          Text(favorites![index].sentenceTr.toString(),),
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
    );
  }
}
