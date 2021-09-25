import 'package:flutter/material.dart';
import 'package:shahed/constant.dart';
import 'package:shahed/models/model.dart';

class TextFiledWidget extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  late List<Character> allCharacter;
  late List<Character> search;

  void searchCharacterItem( String latter){
    allCharacter = search.where((element) => element.name.toLowerCase().startsWith(latter)).toList();
  }


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor:  KPrimaryColor,
      decoration: InputDecoration(
        hintText: 'Search a character',
      ),
      onChanged: (onSearch){
        searchCharacterItem(onSearch);
      },
    );
  }
}
