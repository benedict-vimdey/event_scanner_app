class TicketDataModel{
  final int validTicket;
  final int invalidTicket;
  final double ticketScanned;
  final int pendingTicket;

  TicketDataModel({
    required this.validTicket,
    required this.invalidTicket,
    required this.ticketScanned,
    required this.pendingTicket
  });

  factory TicketDataModel.fromJson(Map <String, dynamic> json){
    return TicketDataModel(
      validTicket: json['data']['valid_ticket'], 
      invalidTicket: json['data']['invalid_ticket'], 
      ticketScanned: json['data']['amount_ticket_scanned'], 
      pendingTicket: json['data']['pending_ticket']
    );
  }
}








  // Future<TicketData?> apiCall() async{
  //   String? _username = const ActivityPage().username;
  //   final appUrl = AppUrl.baseUrl;
  //   String url = "$appUrl/events/api/scanner/dashboard/$_username";

  //   // final   secureStorageProvider = Provider.of<SecureStorageProvider>(context,listen: false);

  //   String token = await TokenProvider().getToken();
  //   // String? token = await secureStorageProvider.getToken();

  //   print("TICKETS URL:: $url");

    
  //   http.Response response = await http.get(Uri.parse(url), headers: {'Authorization': 'Token $token'},);

  //   print("New Token $token");
  //   print("Dashboard Response ${response.body}");

    

  //   if(response.statusCode == 200){
  //     String responseBody = response.body;
  //     final data = jsonDecode(responseBody);
  //     return data;
  //     // return TicketData.fromJson(jsonDecode(responseBody));
  //   } else{
  //     throw Exception('Data Not Found');
  //   }
      

  // }

  