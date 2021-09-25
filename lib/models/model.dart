import 'dart:convert';
import 'dart:async';

class Character {
 late int charId;
 late String name;
 late List occupation; // No Work is Error
 late String img;
 late String status;
 late String nickname;
 late List appearance;
 late String portrayed;
 late String category;
 late List betterCallSaulAppearance;

  Character({
    required this.charId,
    required this.name,
    required  this.occupation,
    required  this.img,
    required  this.status,
    required  this.nickname,
    required  this.appearance,
    required  this.portrayed,
    required  this.category,
    required  this.betterCallSaulAppearance
  });

  Character.fromJson(Map <String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    occupation = json['occupation'];
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = json['appearance'];
    portrayed = json['portrayed'];
    category = json['category'];
    betterCallSaulAppearance =json["better_call_saul_appearance"];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['char_id'] = this.charId;
  //   data['name'] = this.name;
  //   data['birthday'] = this.birthday;
  //   data['occupation'] = this.occupation;
  //   data['img'] = this.img;
  //   data['status'] = this.status;
  //   data['nickname'] = this.nickname;
  //   data['appearance'] = this.appearance;
  //   data['portrayed'] = this.portrayed;
  //   data['category'] = this.category;
  //   data['better_call_saul_appearance'] = this.betterCallSaulAppearance;
  //   return data;
  // }
}