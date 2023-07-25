import 'dart:convert';

import 'package:event_scanner_app/component/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/url.dart';
import '../models/transactions_model.dart';
import '../provider/token_provider.dart';
import '../styles.dart';
import 'activity_page.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {

  // List<DropdownMenuItem<String>> get dropdownItems{
  //   List<DropdownMenuItem<String>> menuItems = [
  //     DropdownMenuItem(child: Text("USA"),value: "USA"),
  //     DropdownMenuItem(child: Text("Canada"),value: "Canada"),
  //     DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
  //     DropdownMenuItem(child: Text("England"),value: "England"),
  //   ];
  //   return menuItems;
  // }

  String selectedValue = "USA";

  Future<List<TransactionsModel>> makeApiCall() async{
    // String? username = const ActivityPage().username;
    final appUrl = AppUrl.baseUrl;
    String url = "$appUrl/events/api/scanner/transactions?101";

    String token = await TokenProvider().getToken();

    print("TICKETS URL:: $url");

    
    http.Response response = await http.get(Uri.parse(url), headers: {'Authorization': 'Token $token'},);

    print("Transactions Token $token");
    print("Transactions Response ${response.body}");

        if(response.statusCode == 200){
      List responseBody = jsonDecode(response.body);

      // return TransactionsModel.fromJson(jsonDecode(responseBody));
      return responseBody.map((e) => TransactionsModel.fromJson(e)).toList();
    } else{
      throw Exception('Data Not Found');
    }

  }

  List<TransactionsModel>? futureTransactions;
  bool hasData = false;

  @override
  void initState(){
    super.initState();

    
    
    getTransactionsData();
  }

  getTransactionsData() async{
    futureTransactions = await makeApiCall();
    hasData = true;
    setState(() {
      
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBodyColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: CustomAppBar(text: "Transactions",),
            ),

            Container(
              height: 56,
              width: 428,
              decoration: BoxDecoration(
                color: Color(0xFFE6E6E6)
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Image.asset("lib/images/Path 1.png")
                    )
                  ],
                ),
              ),
              // child: DropdownButtonFormField(
              //   items: dropdownItems, 
              //   value: selectedValue,
              //   onChanged: (String? newValue){
              //     setState(() {
              //       selectedValue = newValue!;
              //     });
              //   }
              // ),
            ),


            // const Padding(
            //   padding: EdgeInsets.all(25.0),
            //   child: Card(
            //     color: Colors.white,
            //     elevation: 0,
            //     child: ListTile(
            //       title: Text("EVSC002341", style: TextStyle(
            //         //color: Color(0xFF353046), 
            //         fontSize: 16),
            //       ),
            //       subtitle: Text("20 Apri, 2022 | 3:45p", style: TextStyle(fontSize: 10, color: Color(0xFF9C9C9C)),),
            //       trailing: Text("25.00",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            //     ),
            //   ),
            // )

            Expanded(
              child: ListView.builder(
              itemCount: futureTransactions?.length,
              itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                elevation: 0,
                child: 
                ListTile(
                  title: Text(futureTransactions?[index].key ?? '', style: const TextStyle(
                    //color: Color(0xFF353046), 
                    fontSize: 16),
                  ),
                  subtitle: Text("20 Apri, 2022 | 3:45p", style: TextStyle(fontSize: 10, color: Color(0xFF9C9C9C)),),
                  trailing: Text("${futureTransactions?[index].currency ?? ''} ${futureTransactions?[index].price ?? ''} ",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                ),
              );
                
              }),
            ),
              

          ],
        )
      ),
    );
  }
}