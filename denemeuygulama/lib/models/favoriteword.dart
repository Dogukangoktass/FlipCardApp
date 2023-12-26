// To parse this JSON data, do
//
//     final favoriteWord = favoriteWordFromJson(jsonString);

import 'dart:convert';

List<FavoriteWord> favoriteWordFromJson(String str) => List<FavoriteWord>.from(json.decode(str).map((x) => FavoriteWord.fromJson(x)));

String favoriteWordToJson(List<FavoriteWord> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavoriteWord {
  int? favoriteWordId;
  String? wordEn;
  String? wordTr;
  String? sentenceEn;
  String? sentenceTr;

  FavoriteWord({
     this.favoriteWordId,
     this.wordEn,
     this.wordTr,
     this.sentenceEn,
     this.sentenceTr,
  });

  factory FavoriteWord.fromJson(Map<String, dynamic> json) => FavoriteWord(
    favoriteWordId: json["favoriteWordId"],
    wordEn: json["wordEn"],
    wordTr: json["wordTr"],
    sentenceEn: json["sentenceEn"],
    sentenceTr: json["sentenceTr"],
  );
  Map<String, dynamic> toJson() => {
    "favoriteWordId": favoriteWordId,
    "wordEn": wordEn,
    "wordTr": wordTr,
    "sentenceEn": sentenceEn,
    "sentenceTr": sentenceTr,
  };
}
