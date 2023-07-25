// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';


import 'package:event_scanner_app/constants/url.dart';
import 'package:event_scanner_app/provider/token_provider.dart';
// import 'package:event_scanner_app/models/login_res.dart';
import 'package:event_scanner_app/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import '../pages/activity_page.dart';



class AuthProvider extends ChangeNotifier{
  // Base Url 
  final appUrl = AppUrl.baseUrl;

  // String baseUrl = "https://eventaussie.perltechnologies.com";


  


  void loginUser({
    required String username,
    required String password,
    required BuildContext context,
  })async{
    
    notifyListeners();

    String url = "$appUrl/backend/auth/api/login/";

    print("LOGIN URL::: $url");

    // LoginRes(message: message, token: token, data: data)

    Map MapResponse;
    String dataResponse;
    String token;

    final body = {
      "username": username,
      "password": password
    };

    print("REQUEST BODY:: $body");
 
    try {
      http.Response req = await http.post(Uri.parse(url), body: json.encode(body),headers: {"Content-Type":"application/json"});

      if(req.statusCode == 200){
        final res = json.decode(req.body);
        // final res = jsonDecode(req.body);

        print("RESPONSE BODY:: $res");

        MapResponse = res["data"];
        dataResponse = MapResponse["first_name"];
        token = res["token"];

        print("Data Response $MapResponse");
        print("First Name $dataResponse"); 
        print("Auth Token $token");

        TokenProvider().saveToken(token);
        // SecureStorageProvider().storeToken(token);

        showMessage(context, message: "Login Successful");
        notifyListeners();

        
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ActivityPage(name: dataResponse, username: username,)));

        
      }else{
        final res = json.decode(req.body);

        print("RESPONSE BODY:: $res");
        // _isLoading = false;
        // _resMessage = res["message"];
        showErrorMessage(context, message: "Invalid Login Credentials");
        notifyListeners();
      }
    } on SocketException catch(_){
      // _isLoading = false;
      // _resMessage = "Internet Connection is not available";
      showErrorMessage(context, message: "Internet Connection is not available");
      notifyListeners();

    }catch (e) {
      // _isLoading = false;
      // _resMessage = "Please try again";


      showErrorMessage(context, message: "An error occurred please try again");
      notifyListeners();

      print("::: $e");
    }
    
  }

  static Future<bool> userLogin(Map body)async{
    String url = "https://eventaussie.perltechnologies.com/auth/api/login/";
    final uri = Uri.parse(url);
    final response = await http.post(
      uri, 
      body: jsonEncode(body),
      headers: {
        "Content-Type":"application/json"
      }
    );
    
    print("RESPONSE BODY:: ${response.body}");
    return response.statusCode == 200;
  
  }

  //   static Future<String> userLogin(Map body)async{
  //   String url = "https://eventaussie.perltechnologies.com/auth/api/login/";
  //   final uri = Uri.parse(url);
  //   final response = await http.post(
  //     uri, 
  //     body: jsonEncode(body),
  //     headers: {
  //       "Content-Type":"application/json"
  //     }
  //   );
    
  //   print("RESPONSE BODY:: ${response.body}");
  //   if(response.statusCode == 200){
  //     return response.body;
  //   }else{
  //     return "Unable to Login with provided credentials";
  //   }
    
  
  // }
  

}