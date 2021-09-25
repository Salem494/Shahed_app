import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahed/model-view/cubit/breakingbad_cubit.dart';
import 'package:shahed/view/screens/details_screen.dart';
import 'package:shahed/view/screens/home_screen.dart';
import 'package:shahed/view/screens/loginScreen.dart';
import 'package:shahed/view/screens/optscreen.dart';

import 'constant.dart';
import 'models/model.dart';
import 'models/repo.dart';
import 'models/webservices.dart';


class AppRouter {
 late CharacterRepository charactersRepository;
 late BreakingbadCubit charactersCubit;


 AppRouter() {
  charactersRepository = CharacterRepository(WebServices());
  charactersCubit = BreakingbadCubit(charactersRepository);
 }

 Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {

   // case loginScreen:
   //  return MaterialPageRoute(
   //      builder:(context){
   //   return LoginScreen();
   //  } );
   //
   // case optScreen:
   //  return MaterialPageRoute(builder:(context){
   //   return OPTScreen();
   //  } );

   case homeScreen:
    return MaterialPageRoute(
     builder: (_) => BlocProvider(
      create: (BuildContext context) => charactersCubit,
      child: HomeScreen(),
     ),
    );

   case detailsScreen:
    final character = settings.arguments as Character;
    return MaterialPageRoute(
     builder: (_) => BlocProvider(
      create: (BuildContext context) =>
          BreakingbadCubit(charactersRepository),
      child: DetailsScreen(
       character: character,
      ),
     ),
    );
  }
 }
}
