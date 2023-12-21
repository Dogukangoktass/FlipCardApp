// To parse this JSON data, do
//
//     final word = wordFromJson(jsonString);

import 'dart:convert';

List<Word> wordFromJson(String str) => List<Word>.from(json.decode(str).map((x) => Word.fromJson(x)));

String wordToJson(List<Word> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Word {
  int? wordId;
  int? categoryId;
  String? wordTr;
  String? wordEn;
  String? sentenceEn;
  String? sentenceTr;

  Word({
     this.wordId,
     this.categoryId,
     this.wordTr,
     this.wordEn,
     this.sentenceEn,
     this.sentenceTr,
  });

  factory Word.fromJson(Map<String, dynamic> json) => Word(
    wordId: json["wordId"],
    categoryId: json["categoryId"],
    wordTr: json["wordTr"],
    wordEn: json["wordEn"],
    sentenceEn: json["sentenceEn"],
    sentenceTr: json["sentenceTr"],
  );

  Map<String, dynamic> toJson() => {
    "wordId": wordId,
    "categoryId": categoryId,
    "wordTr": wordTr,
    "wordEn": wordEn,
    "sentenceEn": sentenceEn,
    "sentenceTr": sentenceTr,
  };
}
