import 'package:flutter/material.dart';
import 'package:shahed/models/model.dart';
import 'package:shahed/view/widgets/character_item.dart';

class DataSearching extends SearchDelegate {
   List<Character> search;
   DataSearching({required this.search});

   final TextEditingController controller = TextEditingController();
   void clearSearch(){
      controller.clear();
   }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
     IconButton(icon: Icon(Icons.clear),onPressed: (){
       clearSearch();
     },),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  // late  String query = '';
   final filterSearch =  search.where((element) => element.name.toLowerCase().startsWith(query.toLowerCase())).toList();
     return query.isNotEmpty ? GridView.builder(
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
           childAspectRatio: 2/3,
           mainAxisSpacing: 10.0,
           crossAxisSpacing: 10.0,
         ),
         itemCount: filterSearch.length,
         scrollDirection: Axis.vertical,
         padding: EdgeInsets.all(8),
         itemBuilder: (context,index){
           return CharacterItem(
             character: filterSearch[index],
           );
         }): Container();

  }
}