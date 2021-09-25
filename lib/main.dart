import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shahed/route.dart';
import 'package:shahed/salem.dart';
import 'package:shahed/view/screens/home_screen.dart';
import 'package:shahed/view/screens/loginScreen.dart';
import 'package:shahed/view/screens/optscreen.dart';


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
    AppRouter(),
   // appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  MyApp( this.appRouter);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tv app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: OPTScreen(),
      // routes: routes,
      // initialRoute: LoginScreen.routeName,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
