import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shahed/constant.dart';
import 'package:shahed/model-view/cubit/breakingbad_cubit.dart';
import 'package:shahed/models/model.dart';
import 'package:shahed/models/webservices.dart';
import 'package:shahed/view/widgets/character_item.dart';
import 'package:shahed/view/widgets/search_delegate.dart';

class HomeScreen extends StatefulWidget {
  // static String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WebServices webServices = new WebServices();
  late List<Character> allCharacter;
   bool isSearch = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // webServices.getData();
    allCharacter = BlocProvider.of<BreakingbadCubit>(context).getData();
  }

  Widget buildBlogWidget() {
    return BlocBuilder<BreakingbadCubit,BreakingbadState>(
      builder:(context,state) {
        if(state is BreakingCharacterLoaded ){
          allCharacter = (state).character;
          return buildLoadedListWidget();
        }else{
          return buildIndicatortWidget();
        }
      }) ;
  }


  Widget buildLoadedListWidget (){
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      childAspectRatio: 2/3,
      mainAxisSpacing: 5.0,
       crossAxisSpacing: 5.0,
    ),
        itemCount: allCharacter.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(8),
        itemBuilder: (context,index){
       return CharacterItem(
         character: allCharacter[index],
       );
        });
  }

  Widget buildIndicatortWidget (){
    return Center(child: CircularProgressIndicator(),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TextColor,
        actions: [
         Padding(
           padding: const EdgeInsets.only(right: 8),
           child: IconButton(icon: Icon(Icons.search,color: Colors.white,size: 25,),
             onPressed: (){
             showSearch(context: context, delegate: DataSearching(search: allCharacter));
             },),
         ),
        ],
        centerTitle: true,
        elevation: 0.0,
        title: Text('BreakingBad Characters'),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            ){
          final bool connected = connectivity != ConnectivityResult.none;

          if (connected) {
            return buildBlogWidget();
          } else {
            return buildNoInternetWidget();
          }
        },
        child: buildIndicatortWidget(),
      ),

        drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 15,),
             Container(
            padding: EdgeInsets.only(
              top: 35
            ),
            child: Column(
              children: [
                Image.asset('assets/profile2.jpg',fit: BoxFit.cover,height: 180,),
                SizedBox(height: 15,),
                Text('Salem El Helw',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: TextColor2
                ),),
                Text('+201068984178',style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: TextColor2
                ),)
              ],
            ),
            width: double.infinity,
            color: KPrimaryLightColor,
            height: MediaQuery.of(context).size.height * .4,
          ),
            ListTileWidget('MyProfile', Icons.person,Icons.double_arrow_outlined),
            Divider(color: Colors.grey,),
            ListTileWidget('History', Icons.history,Icons.double_arrow_outlined),
            Divider(color: Colors.grey,),
            ListTileWidget('Settings', Icons.settings,Icons.double_arrow_outlined),
            Divider(color: Colors.grey,),
            ListTileWidget('Help', Icons.help,Icons.double_arrow_outlined),
            Divider(color: Colors.grey,),
           ListTile(title: Text('Log Out',style: TextStyle(
             fontWeight: FontWeight.bold
           ),),leading: Icon(Icons.logout,color: Colors.red,),),
           SizedBox(height: 15,),
            Row(
              children: [
                SoicalMediaWidget('assets/00.png'),
                SizedBox(width: 5,),
                SoicalMediaWidget('assets/01.png'),
                SizedBox(width: 5,),
                SoicalMediaWidget('assets/02.png'),
              ],
            )
          ],
        ),
      ),
      // body: FutureBuilder(
      //   future: webServices.getData(),
      //   builder: (context,snapshot){
      //
      //     List<Character>? char = snapshot.data as List<Character>?;
      //
      //     if(!snapshot.hasData){
      //       return Center(child: Text('No DATA FOUNDED'));
      //     }else if (snapshot.hasError){
      //       return Center(child: CircularProgressIndicator(),);
      //     }
      //     return ListView.builder(
      //       itemCount:char!.length,
      //       itemBuilder: (context,i){
      //         print('Saleeeeem');
      //         return Center(
      //           child: Column(
      //             children: [
      //              Text(char[i].occupation.toString()),
      //               // Text(char[i].occupation.toString()),
      //               // Text(snapshot.data[i].),
      //             ],
      //           ),
      //         );
      //       },
      //     );
      //   },
      // )
    );
  }
  Widget buildNoInternetWidget(){
    return Center(
      child: Column(
        children: [
          Image.asset('assets/10.png',fit: BoxFit.cover,height: 250,width: double.infinity,),
          SizedBox(height: 10,),
          Text('Please Check Your Internet',style: TextStyle(
            fontSize: 25,
            color: TextColor2,
          ),)
        ],
      ),
    );
  }


  Widget ListTileWidget(String title,IconData icon,IconData icon2 ) {
    return ListTile(
     title: Text(title,style: TextStyle(
       fontWeight: FontWeight.bold
     ),),
      leading: Icon(icon,color: TextColor2,),
      trailing: Icon(icon2),
    );
  }

  Widget SoicalMediaWidget(String img){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(img,fit: BoxFit.cover,color: TextColor2,height: 25,width: 25,),
    );
  }
}
