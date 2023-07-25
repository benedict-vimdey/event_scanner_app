import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenProvider extends ChangeNotifier{
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  

  String _token = "";

  String get token => _token;

  void saveToken(String token) async{
    print("Saved token $token");
    SharedPreferences value = await _pref;
    value.setString('token', token);
  }

  Future<String> getToken() async{
    SharedPreferences value = await _pref;

    if(value.containsKey('token')){
      String payload = value.getString('token')!;
      print("Gotten Token $payload");
      _token = payload;
      notifyListeners();
      return payload;
    }else{
      _token = '';
      notifyListeners();
      return '';
    }
  }
}