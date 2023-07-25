class TransactionsModel{
  final String? scanner;
  final String key;
  final double price;
  final String currency;
  final int? status;
  final DateTime? created;

  TransactionsModel({
    this.scanner,
    required this.key,
    required this.price,
    required this.currency,
    this.status,
    this.created
  });

  factory TransactionsModel.fromJson(Map <String, dynamic> json){
    return TransactionsModel(
      key: json['key'], 
      price: json['price'], 
      currency: json['currency'], 
      // created: json['created']
    );
  }
}