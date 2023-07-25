import 'dart:convert';

import 'package:event_scanner_app/component/activity_actions.dart';
import 'package:event_scanner_app/component/stat_data.dart';
import 'package:event_scanner_app/models/ticket_model.dart';
import 'package:event_scanner_app/pages/scan_page.dart';
import 'package:event_scanner_app/pages/ticket_details.dart';
import 'package:event_scanner_app/pages/transactions.dart';
import 'package:event_scanner_app/pages/transactions_page.dart';
import 'package:event_scanner_app/provider/token_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import '../constants/url.dart';
import '../models/transactions_model.dart';
import '../styles.dart';


class ActivityPage extends StatefulWidget {
  final String? name;
  final String? username;
  const ActivityPage({super.key,
   this.name,
   this.username,
  });

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

  String get _name => widget.name ?? '';
  String get _username => widget.username ?? '';

  Future<TicketDataModel> apiCall() async{
    // String? _username = const ActivityPage().username;
    final appUrl = AppUrl.baseUrl;
    String url = "$appUrl/events/api/scanner/dashboard/$_username";

    // final   secureStorageProvider = Provider.of<SecureStorageProvider>(context,listen: false);

    // String? token = await secureStorageProvider.getToken();
    String token = await TokenProvider().getToken();

    print("TICKETS URL:: $url");

    
    http.Response response = await http.get(Uri.parse(url), headers: {'Authorization': 'Token $token'},);

    print("New Token $token");
    print("Dashboard Response ${response.body}");

    

    if(response.statusCode == 200){
      String responseBody = response.body;
      // final data = jsonDecode(responseBody);
      // return data;
      return TicketDataModel.fromJson(jsonDecode(responseBody));
    } else{
      throw Exception('Data Not Found');
    }
      

  }


  // Future<List<TransactionsModel>> makeApiCall() async{
  //   // String? username = const ActivityPage().username;
  //   final appUrl = AppUrl.baseUrl;
  //   String url = "$appUrl/events/api/scanner/transactions?$_username";

  //   String token = await TokenProvider().getToken();

  //   print("TICKETS URL:: $url");

    
  //   http.Response response = await http.get(Uri.parse(url), headers: {'Authorization': 'Token $token'},);

  //   print("Transactions Token $token");
  //   print("Transactions Response ${response.body}");

  //       if(response.statusCode == 200){
  //     List responseBody = jsonDecode(response.body);

  //     // return TransactionsModel.fromJson(jsonDecode(responseBody));
  //     return responseBody.map((e) => TransactionsModel.fromJson(e)).toList();
  //   } else{
  //     throw Exception('Data Not Found');
  //   }

  // }

  // List<TransactionsModel>? futureTransactions;
  TicketDataModel? futureTicket;
  bool hasData = false;

  @override
  void initState(){
    super.initState();

    // futureTicket = apiCall();
    getTicketData();
    // getTransactionsData();
  }

  getTicketData() async{

    futureTicket = await apiCall();
    
    hasData = true;
    setState(() {
      
    });
  }


  // getTransactionsData() async{
  //   futureTransactions = await makeApiCall();
  //   hasData = true;
  //   setState(() {
      
  //   });
  // }
  
  

  activityNavigate(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TicketDetails()));
  }

  scannerNavigate(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ScanPage() ));
  }

  transactionsNavigate(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TransactionsPage() ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBodyColor,
      body: SafeArea(
        child: hasData?
           Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("lib/images/passport.png"),
                  ),
                  
                  const SizedBox(width: 10,),
                  
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Hello", style: TextStyle(color: Colors.black),),
                        // Text("Antony", style: TextStyle(color: Colors.black),)
                        Text(_name, style: TextStyle(color: Colors.black),)
                      ],
                    ),
                  ),
                
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Image.asset("lib/images/Path 1.png"),
                  )
                  ],
                ),
          
                const SizedBox(height: 20,),
            
                // Main Page Details
            
                Row(
                  children: [
                    StatData(title: "scanned valid tickets", figure: futureTicket?.validTicket ?? 0,),
          
                    const SizedBox(width: 10,),
          
                    StatData(title: "Total amounts of tickets scanned", figure:futureTicket?.ticketScanned.toInt() ?? 0,),
                  ],
                ),
          
                const SizedBox(height: 10,),
          
                Row(
                  children: [
                    StatData(title: "Invalid tickets", figure:futureTicket?.invalidTicket ?? 0,),
          
                    const SizedBox(width: 10,),
          
                    StatData(title: "pending tickets", figure: futureTicket?.pendingTicket ?? 0,),
                  ],
                ),
        
          
                // Expanded(
                  
                //   child: Row(
                    
                //     children: [
                //       ActivityActions(ImagePath: "lib/images/scan in.png", description: "Scan",),
                //     ],
                //   ),
                // )
            
              ],
            ),
          ),
             
          const SizedBox(height: 10,),
          
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text("Activity", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
          ),
          
          // const SizedBox(height: 7,),
          
          Stack(
            children: [
              Container(
                height: 148,
                width: 461,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ActivityActions(ImagePath: "lib/images/scan in.png", description: "Scan", onTap: scannerNavigate,),
                        ActivityActions(ImagePath: "lib/images/scan in.png", description: "Enter Code", onTap: activityNavigate,),
                        ActivityActions(ImagePath: "lib/images/wallet.png", description: "Transactions", onTap: transactionsNavigate,)
                      ],
                    ),
                  ),
                ),
              ),
             
            ],
          ),
             
          const SizedBox(height: 10,),
             
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Transactions", style: TextStyle(color: Color(0xFF353046), fontSize: 18),),
          
                    Text("View all")
                  ],
                ),
             
                const SizedBox(height: 15,),
           
                SizedBox(
                  height: 100,
                  child: Transactions()
                ),
             
              //  Expanded(
              //    child: ListView.builder(
              //     itemCount: 3,
              //     itemBuilder: (context, index) {
              //     return Card(
              //       color: Colors.white,
              //       elevation: 0,
              //       child: 
              //       ListTile(
              //         title: Text(futureTransactions?[index].key ?? '', style: const TextStyle(
              //           //color: Color(0xFF353046), 
              //           fontSize: 16),
              //         ),
              //         subtitle: Text("20 Apri, 2022 | 3:45p", style: TextStyle(fontSize: 10, color: Color(0xFF9C9C9C)),),
              //         trailing: Text("${futureTransactions?[index].currency ?? ''} ${futureTransactions?[index].price ?? ''} ",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              //       ),
              //     );
                   
              //    }),
              //  ),
                
              ],
            ),
          )
        ],
               ): const Center(
        child: CircularProgressIndicator(), 
          ),
      )
    );
  }
}