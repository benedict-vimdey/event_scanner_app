import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageProvider extends ChangeNotifier{
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> storeToken(String token) async{
    await storage.write(key: 'token', value: token);
    print("Saved Token $token");
  }

  Future<String?> getToken() async{
    Future<String?> value = storage.read(key: 'token');
    return value;
  }
}