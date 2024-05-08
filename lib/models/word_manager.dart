import 'package:flutter/material.dart';

import '../api/dictionary_service.dart';

class Word {
  String word;
  String meaning;
  bool bookmark;

  Word({required this.word, required this.meaning, required this.bookmark});

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
        word: json["word"],
        meaning: json["meaning"],
        bookmark: json["bookmark"]);
  }
}

late List<dynamic> _wordList;
late List<Word> words;
late List<Word> filterdWords;
late List<Word> bookmarks;

Future<void> initalizeWords() async {
  _wordList = DictionaryService().fetchWords();
  List<Word> wordsList = [];
  for (var element in _wordList) {
    wordsList.add(Word.fromJson(element));
  }
  words = wordsList;

  final bookmarkWord =
      _wordList.where((element) => element["bookmark"] == true);
  List<Word> bookmarksList = [];
  for (var element in bookmarkWord) {
    bookmarksList.add(Word.fromJson(element));
  }
  bookmarks = bookmarksList;
}

class WordManager extends ChangeNotifier {
  void filterWords(String filterText) {
    filterdWords = [];

    if (filterText.isEmpty) {}

    for (var element in words) {
      if (filterText.length > element.word.length) {
        continue;
      }
      if (element.word.toLowerCase().substring(0, filterText.length) ==
          filterText.toLowerCase()) {
        filterdWords.add(element);
      }
    }
    notifyListeners();
  }

  void toogleBookmark(String wordTitle) {
    final word = words.firstWhere((element) => element.word == wordTitle);

    if (bookmarks.contains(word)) {
      bookmarks.remove(word);
      notifyListeners();
    } else {
      word.bookmark = !word.bookmark;
      bookmarks.add(word);
      notifyListeners();
    }

    word.bookmark = !word.bookmark;
    final index = words.indexWhere((element) => element.word == wordTitle);
    words[index] = word;

    DictionaryService().toogleBookmark(index);

    notifyListeners();
  }
}
