import 'dart:convert';

import 'package:event_scanner_app/models/transactions_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/url.dart';
import '../provider/token_provider.dart';
import 'activity_page.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {

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
  void initState() {
    getTransactionsData();
    super.initState();
  }

  getTransactionsData() async{
    futureTransactions = await makeApiCall();
    hasData = true;
    setState(() {
      
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
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
    );
 
  }
}

// subtitle: Text("20 Apri, 2022 | 3:45p", style: TextStyle(fontSize: 10, color: Color(0xFF9C9C9C)),),