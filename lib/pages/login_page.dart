import 'package:event_scanner_app/component/login_form.dart';
import 'package:flutter/material.dart';


import '../styles.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBodyColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 82,),
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey
                  ),
                  child: Image.asset("lib/images/QR_code.png")
                ),
                const Text(
                  "EVENT SCANNER", 
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                  ),
                ),
          
                const SizedBox(height: 50,),
          
                const Text("Sign in to continue"),
          
                const SizedBox(height: 30,),
          
                LoginForm()
              ],
            ),
          ),
        ),
      )
    );
  }
}