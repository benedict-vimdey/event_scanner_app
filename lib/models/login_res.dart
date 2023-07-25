import 'login_res_data.dart';

class LoginRes{
  final String message;
  final String token;
  final Data data;

  LoginRes({required this.message, required this.token, required this.data});
}