import 'dart:convert';
import 'package:denemeuygulama/models/word.dart';
import 'package:denemeuygulama/services/word_api.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/my_card_button.dart';
import '../services/favorite_api.dart';

class WordView extends StatefulWidget {
  const WordView({super.key, required this.userId});
  final int userId;

  @override
  State<WordView> createState() => _WordViewState();
}

class _WordViewState extends State<WordView> {
  List<Word>? words;
  int id = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async{
    var mWords = await WordApi().getWords();
    setState(() {
      if(mounted){
        words =mWords;
      }
    });
  }

  void favoriteAdd(int wordId) async
  {
    final response = await http.post(
      Uri.parse('https://webapi20231207005716.azurewebsites.net/api/Favorite/PostFavorite?userId=${widget.userId}&wordId=${wordId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if(response.statusCode==200 ||response.statusCode==201 ||response.statusCode==204)
    {
      print(response.body);
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
    }
    print(response.statusCode);
    print("favori ekleme başarılı");
  }

  void clickNext() {
    setState(() {
      id++;
      print(id);
      print(words!.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                if (words == null)
                  Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  FlipCardWidget(
                    sentenceEn: words![id].sentenceEn.toString(),
                    sentenceTr: words![id].sentenceTr.toString(),
                    textEn: words![id].wordEn.toString(),
                    textTr: words![id].wordTr.toString(),
                  ),
                Container(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        MyCardButton(
                          onTap: () {},
                          icon: Icons.check_outlined,
                          color: Colors.grey.shade200.withOpacity(0.5),
                        ),
                        Spacer(),
                        MyCardButton(
                          onTap: () {},
                          icon: Icons.question_mark_outlined,
                          color: Colors.grey.shade200.withOpacity(0.5),
                        ),
                        Spacer(),
                        MyCardButton(
                          onTap: () {
                            setState(() {
                              favoriteAdd(words![id].WordId!);
                             print("word ID  :");
                              print(words![id].WordId!.toString());
                            });
                            clickNext();
                            // buraya listedeki kelimenin wordId gelecek
                          },
                          icon: Icons.favorite_border_outlined,
                          color: Colors.grey.shade200.withOpacity(0.5),
                        ),
                        Spacer(),
                        MyCardButton(
                          onTap: () {
                            clickNext();
                          },
                          icon: Icons.navigate_next_outlined,
                          color: Colors.grey.shade200.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class FlipCardWidget extends StatelessWidget {
  final String textTr;
  final String textEn;
  final String sentenceEn;
  final String sentenceTr;

  const FlipCardWidget({
    super.key,
    required this.textTr,
    required this.textEn,
    required this.sentenceEn,
    required this.sentenceTr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.red.shade200.withOpacity(0.5),
              ),
            ),
            Text(
              textEn,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Text(
                sentenceEn,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        back: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blue.shade200.withOpacity(0.5),
              ),
            ),
            Text(
              textTr,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Text(
                sentenceTr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
