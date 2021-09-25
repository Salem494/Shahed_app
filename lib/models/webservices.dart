import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:shahed/models/model.dart';

class WebServices {

  Future<List<Character>?> getData() async {
    var url = Uri.parse('https://www.breakingbadapi.com/api/characters');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      // print(await response.body);
      List<Character> list = [];
      var body = jsonDecode(response.body);
      // print("the booooody ${body}");
      for (var item in body) {
        list.add(Character.fromJson(item));
        // print('ITEM IS.....${item}');
      }
      print('lllllllllll == ${list.length}');
      return list;
    }
    else{
      print(" This Error  is =>  ${response.reasonPhrase}");
    }
   return null;
  }
}
