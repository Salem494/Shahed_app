import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shahed/constant.dart';
import 'package:shahed/models/model.dart';
import 'package:shahed/view/screens/details_screen.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({required this.character});


  void onClick(context){
     Navigator.pushNamed(context, detailsScreen,arguments: character);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onClick(context),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
             decoration: BoxDecoration(
               color: TextColor,
               borderRadius: BorderRadius.circular(15),
             ),
            child: Hero(
              tag: character.charId,
              child: GridTile(
                  child: character.img.isNotEmpty? FadeInImage.assetNetwork(placeholder:"assets/1.gif" ,image:character.img,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                      : Image.asset("assets/1.gif",fit: BoxFit.cover,),
                 footer: Container(
                   decoration: BoxDecoration(
                     color: KPrimaryLightColor,
                   ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(character.name,style: TextStyle(
                      color: TextColor2,
                      fontSize: 18
                    ),),
                  ),
                  width: double.infinity,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
