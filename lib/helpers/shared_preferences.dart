import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{

  setLogInStatus(bool status)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('loginStatus',status );
  }
  
  getLogInStatus()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool('loginStatus');
    return value ?? false;
  }
}