import 'package:flutter/material.dart';
import 'package:shahed/models/model.dart';

// ignore: must_be_immutable
class SliverAppBarWidget extends StatelessWidget {
  late Character character;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 650.0,
      elevation: 2.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(character.nickname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),
        background: Hero(
          tag: character.charId,
          child: Image.network(character.img,fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
