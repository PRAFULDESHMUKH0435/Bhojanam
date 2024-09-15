import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Res/Routes/RouteNames.dart';
import 'package:untitled2/Res/Routes/Routes.dart';
import 'Providers/AuthViewProvider.dart';
import 'Providers/HomeScreenProvider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthViewProvider()),
      ChangeNotifierProvider(create: (_)=>HomeScreenProvider()),
    ],
    child: MaterialApp(
      title: "Tiffin Service App",
      debugShowCheckedModeBanner: false,
      initialRoute:RouteNames.homeScreen,
      onGenerateRoute:Routes.generateRoutes,
    ),);
  }
}
