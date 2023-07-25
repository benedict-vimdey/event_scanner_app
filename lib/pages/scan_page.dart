import 'package:event_scanner_app/pages/ticket_details.dart';
import 'package:flutter/material.dart';

import '../component/custom_app_bar.dart';
import '../styles.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  
  void activityNavigate(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TicketDetails()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBodyColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const CustomAppBar(),

              const SizedBox(height: 33,),

              const Text("Event tickets details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24 ),),

              const SizedBox(height: 60,),

              

              TextButton(onPressed: activityNavigate, child: Text("Tap to enter code instead", style: TextStyle(color: Color(0xFF032D9D)),)),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Image.asset("lib/images/Vector.png", width: 30,),
                  onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityPage()));
                  },
                  style: TextButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.white)
                    )
                  ), 
                  label:const Text("Scan QR code") ,
                  // child:  const Text("Scan QR code"),
                ),
              ),

              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}