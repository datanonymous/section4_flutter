import 'package:flutter/material.dart'; //foundation.dart uses the @required decorator

class Transaction{
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({@required this.id, @required this.title, @required this.amount, @required this.date});
}