import 'package:flutter/material.dart';

void showErrorMessage(
    BuildContext context,
    {required String message}
  ){
    final snackBar = SnackBar(
    content: Text(
      message, 
      style: const TextStyle(fontSize: 16),
    ),
    backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
      
  }

  void showSuccessMessage(BuildContext context, {required String message}){
    final snackBar = SnackBar(
    content: Text(
      message, 
      style: const TextStyle(fontSize: 16),
    ),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
      
  }

  void showMessage(BuildContext context, {required String message}){
    final snackBar = SnackBar(
    content: Text(
      message, 
      style: const TextStyle(fontSize: 16),
    ),
    backgroundColor: Colors.blue.shade700,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
      
  }