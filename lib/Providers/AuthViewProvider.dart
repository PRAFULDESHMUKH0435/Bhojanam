import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/Res/Routes/RouteNames.dart';

class AuthViewProvider with ChangeNotifier{

  CheckUserAlreadyLoggedInOrNot(BuildContext context) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("UserLoginToken", "10");
    if(sharedPreferences.containsKey("UserLoginToken")){
      Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
    }else{
      Navigator.pushReplacementNamed(context, RouteNames.loginscreen);
    }
  }




}