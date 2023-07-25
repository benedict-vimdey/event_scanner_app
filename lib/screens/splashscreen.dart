import 'dart:async';


import 'package:event_scanner_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Timer(
    //   Duration(seconds: 3),
    //    () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()))
    // );

    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });

    // Future.delayed(Duration(seconds: 3), (){
    //   TokenProvider().getToken().then((value) {
    //     if(value == ''){
    //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    //     }else{
    //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ActivityPage() ));
    //     }
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Spacer(),
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
                
                const SizedBox(height: 20,),

                const SpinKitFadingCircle(
                  color: Colors.white,
                  size: 50.0,
                  // controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))
                ),
          
               const Spacer(),
          
               SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    elevation: 0,
                    backgroundColor: kSplashColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.white)
                    )
                  ), 
                  child:  const Text("Sign In", style: TextStyle(color: Colors.black),),
                ),
               ),

               const SizedBox(height: 80,)
              ],
          
            ),
          ),
        ),
      ) ,
    );
  }
}