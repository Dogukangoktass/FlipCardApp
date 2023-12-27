import 'package:flutter/material.dart';

import '../components/drawer.dart';
import '../models/favoriteword.dart';
import '../models/learnword.dart';
import '../services/learn_api.dart';

class LearnView extends StatefulWidget {
  const LearnView({super.key, required this.userId});
  final int userId;

  @override
  State<LearnView> createState() => _LearnViewState();
}

class _LearnViewState extends State<LearnView> {
  List<LearnWord>? getLearn;

  void initState() {
    super.initState();
    print(widget.userId);
    getData();
  }
  getData() async{
    var mWords =await LearnApi().getLearns(widget.userId);
    setState(() {
      if(mounted){
        getLearn =mWords;
      }
    });
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
                return IconButton(onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                    icon: Icon(Icons.menu_rounded, color: Colors.red,));
              }
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
        child: getLearn == null || getLearn!.isEmpty ? Center(
          child: Text("Öğrenilecek Kelime Yok", style: TextStyle(
              fontSize: 30,
              color: Colors.white70
          ),),)
            : ListView.builder(
          itemCount: getLearn!.length,
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
                                Text(getLearn![index].wordTr.toString(),),
                                Spacer(),
                                Text(getLearn![index].wordEn.toString(),),
                                Spacer()
                              ],
                            ),
                            Text(getLearn![index].sentenceEn.toString(),),
                            Text(getLearn![index].sentenceTr.toString(),),
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
      ),
    );
  }
}
