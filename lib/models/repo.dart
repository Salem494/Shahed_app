
import 'dart:convert';

import 'package:shahed/models/webservices.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class CharacterRepository {
  late final WebServices webServices;

  CharacterRepository(this.webServices);

  Future<List<Character>?> getData() async {
    var url = Uri.parse('https://www.breakingbadapi.com/api/characters');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      List<Character> list = [];
      var body = jsonDecode(response.body);
      for (var item in body) {
        list.add(Character.fromJson(item));
      }
      print('lllllllllll == ${list.length}');
      return list;
    }else {
      print(response.reasonPhrase);
      return null;
    }
  }
}