
import 'dart:convert';

List<LearnWord> learnWordFromJson(String str) => List<LearnWord>.from(json.decode(str).map((x) => LearnWord.fromJson(x)));

String learnWordToJson(List<LearnWord> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LearnWord {
  int? unKnownWordId;
  String? wordEn;
  String? wordTr;
  String? sentenceEn;
  String? sentenceTr;

  LearnWord({
    this.unKnownWordId,
    this.wordEn,
    this.wordTr,
    this.sentenceEn,
    this.sentenceTr,
  });

  factory LearnWord.fromJson(Map<String, dynamic> json) => LearnWord(
    unKnownWordId: json["unKnownWordId"],
    wordEn: json["wordEn"],
    wordTr: json["wordTr"],
    sentenceEn: json["sentenceEn"],
    sentenceTr: json["sentenceTr"],
  );
  Map<String, dynamic> toJson() => {
    "unKnownWordId": unKnownWordId,
    "wordEn": wordEn,
    "wordTr": wordTr,
    "sentenceEn": sentenceEn,
    "sentenceTr": sentenceTr,
  };
}
