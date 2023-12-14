import 'package:flutter/material.dart';
import 'package:transactions/common/helpers/app_formatter.dart';

import '../../../models/transaction/transaction.dart';

class TransactionDetailsCard extends StatelessWidget {
  const TransactionDetailsCard({super.key, required this.transaction});

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    final String date =
        AppFormatter.dateFormat(DateTime.parse(transaction.createdAt));

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text('Operation'),
              subtitle: Text(transaction.type.name),
            ),
            ListTile(
              title: const Text('Date'),
              subtitle: Text(date),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Amount: ${AppFormatter.currencyFormat(transaction.amount)}',
                ),
                Text(
                  'Commission: ${AppFormatter.currencyFormat(transaction.commission)}',
                ),
                const SizedBox(height: 8),
                Text(
                  'Total: ${AppFormatter.currencyFormat(transaction.total)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
