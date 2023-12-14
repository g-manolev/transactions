import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transactions/screens/transaction_details/widgets/transaction_details_card.dart';

import '../../models/transaction/transaction.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({super.key, required this.transaction});

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.3),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text('№ ${transaction.transactionNumber}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TransactionDetailsCard(transaction: transaction),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Cancel transaction'),
            )
          ],
        ),
      ),
    );
  }
}
