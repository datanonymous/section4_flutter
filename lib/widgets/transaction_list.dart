import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
//                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () {
                    print('long press: ' + transactions[index].title);
                    print('index of item: ' + index.toString());
                  },
                  child: Card(
                    elevation: 10,
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '\$' +
                                transactions[index].amount.toStringAsFixed(2),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Theme.of(context).primaryColorDark),
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          padding: EdgeInsets.all(10.0),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              transactions[index].title,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMMd("en_US").format(transactions[
                                      index]
                                  .date), //https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        //If the width of the screen is greater than 300 pixels, display flatbutton rather than icon button
                        MediaQuery.of(context).size.width > 300
                            ? FlatButton.icon(
                                onPressed: () =>
                                    deleteTx(transactions[index].id),
                                icon: Icon(Icons.delete),
                                label: Text(
                                  'Delete',
                                ),
                                textColor: Theme.of(context).errorColor,
                              )
                            : IconButton(
                                icon: Icon(Icons.delete),
                                color: Theme.of(context).errorColor,
                                onPressed: () =>
                                    deleteTx(transactions[index].id),
                              ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
