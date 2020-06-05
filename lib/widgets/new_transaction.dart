import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    //todo: add logic here to get rid of bottom modal sheet
    //    Navigator.pop(context); //this works too, what's the difference?
    Navigator.of(context).pop();
    //https://medium.com/@ksheremet/flutter-showing-snackbar-within-the-widget-that-builds-a-scaffold-3a817635aeb2
//    Scaffold.of(context).showSnackBar(
//      SnackBar(
//        content: Text('Transaction submitted!'),
//      ),
//    );
    //https://pub.dev/packages/flushbar
    Flushbar(
      title: 'Yay!',
      message: 'Transaction submitted!',
      duration: Duration(seconds: 3),
    )..show(context);

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add transaction'),
              onPressed: submitData,
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
