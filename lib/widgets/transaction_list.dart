import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'No Expenses',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          )
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
              key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx,
                    ))
                .toList(),
          );
    /*.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, i) {
              return TransactionItem(
                  transaction: transactions[i], deleteTx: deleteTx);
            },
          );*/
  }
}
