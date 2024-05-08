import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

late Map<String, dynamic> json;

// fetch words from words.json file if the app is running for the first time and from device using shared preferance if not.
Future<void> initalizeDictionaryService() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("words") == null) {
    final dataString = await rootBundle.loadString("assets/data/words.json");
    json = jsonDecode(dataString);
  } else {
    final dataString = prefs.getString("words");
    json = jsonDecode(dataString ?? "");
  }
}

class DictionaryService {
  /// return fetched words.
  List<dynamic> fetchWords() {
    if (json['words'] != null) {
      return json['words'];
    } else {
      return [];
    }
  }

  /// update bookmark state.
  toogleBookmark(int index) async {
    json['words'][index]["bookmark"] = !json['words'][index]["bookmark"];
    save(json["words"]);
  }

  /// save changes to device using shared prefernces file.
  void save(List<dynamic> words) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    json["words"] = words;
    await prefs.setString("words", jsonEncode(json));
  }
}
