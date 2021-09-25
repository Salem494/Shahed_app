import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahed/constant.dart';
import 'package:shahed/model-view/cubit/breakingbad_cubit.dart';
import 'package:shahed/models/model.dart';
import 'package:shahed/view/widgets/silver_appbar.dart';

class DetailsScreen extends StatelessWidget {

  final Character character;

  const DetailsScreen({Key? key,required this.character}) : super(key: key);


  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickname,
          style: TextStyle(color: Colors.grey),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: KPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: KPrimaryColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 25,
      endIndent: endIndent,
      color: TextColor,
      thickness: 2,
    );
  }

  // Widget checkIfQuotesAreLoaded(CharactersState state) {
  //   if (state is QuotesLoaded) {
  //     return displayRandomQuoteOrEmptySpace(state);
  //   } else {
  //     return showProgressIndicator();
  //   }
  // }

  Widget displayRandomQuoteOrEmptySpace(state) {
    var quotes = (state).quotes;
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return Center(
        // child: DefaultTextStyle(
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     fontSize: 20,
        //     color: KPrimaryColor,
        //     shadows: [
        //       Shadow(
        //         blurRadius: 7,
        //         color: KPrimaryColor,
        //         offset: Offset(0, 0),
        //       )
        //     ],
        //   ),
        //   // child: AnimatedTextKit(
        //   //   repeatForever: true,
        //   //   animatedTexts: [
        //   //     FlickerAnimatedText(quotes[randomQuoteIndex].quote),
        //   //   ],
        //   // ),
        // ),
      );
    } else {
      return Container();
    }
  }

  Widget showProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: KPrimaryLightColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<BreakingbadCubit>(context).getQuotes(character.name);
    return Scaffold(
      backgroundColor: KPrimaryLightColor,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text('Your Info',style: TextStyle(
                          color: TextColor2,
                          fontSize: 25,
                        ),),
                      ),
                      SizedBox(height: 15,),
                      characterInfo('Job : ', character.occupation.join(' / ')),
                      buildDivider(315),
                      characterInfo(
                          'Appeared in : ', character.category),
                      buildDivider(250),
                      characterInfo('Seasons : ',
                          character.appearance.join(' / ')),
                      buildDivider(280),
                      characterInfo('Status : ', character.status),
                      buildDivider(300),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : characterInfo('Better Call Saul Seasons : ',
                          character.betterCallSaulAppearance.join(" / ")),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : buildDivider(150),
                      characterInfo('Actor/Actress : ', character.nickname),
                      buildDivider(235),
                      SizedBox(
                        height: 20,
                      ),
                      // BlocBuilder<CharactersCubit, CharactersState>(
                      //   builder: (context, state) {
                      //     return checkIfQuotesAreLoaded(state);
                      //   },
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


