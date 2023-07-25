import 'package:event_scanner_app/pages/scan_page.dart';
import 'package:flutter/material.dart';

import '../component/custom_app_bar.dart';
import '../styles.dart';

class TicketDetails extends StatefulWidget {
  const TicketDetails({super.key});

  @override
  State<TicketDetails> createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {

  String ticketCode = '';


  void scannerNavigate(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ScanPage() ));
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
              CustomAppBar(),

              const SizedBox(height: 33,),

              const Text("Event tickets details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24 ),),

              const SizedBox(height: 60,),

              TextFormField(
                decoration:const InputDecoration(
                  hintText: 'Enter ticket code',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter your ticket code';
                  }
                  return null;
                },
                onSaved: (value){
                  ticketCode = value!;
                },
              ),

              TextButton(onPressed: scannerNavigate, child: Text("Tap to use scanner instead", style: TextStyle(color: Color(0xFF032D9D)),)),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
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
                  child:  const Text("Continue"),
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

